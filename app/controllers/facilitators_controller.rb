class FacilitatorsController < ApplicationController

  def new
    @facilitator = Facilitator.new
    @user = User.new
  end

  def create
    @facilitator = new_facilitator
    @facilitator.organization = organization
    if @facilitator.save
      facilitator_locations(@facilitator.id)
      session["organization.name"] = organization.name
      flash[:success] = 'Welcome!'
      sign_in_and_redirect @facilitator.user
    else
      flash[:error] = 'Your account failed to create'
    end
  end

  private

  def organization
    Organization.find_by(name: params[:organization_name])
  end

  def new_facilitator
    Facilitator.new(facilitator_params)
  end

  def invite
    Invite.find_by(email: facilitator_params[:user_attributes][:email])
  end

  def invite_locations
    InviteLocation.where(invite_id: invite)
  end

  def facilitator_locations(facilitator)
    invite_locations.each do |location|
      FacilitatorLocation.create(location_id: location.location_id, facilitator_id: facilitator)
    end
  end

  def facilitator_params
    params.require(:facilitator).permit(
      :name, :organization_name,
      user_attributes: [:email, :id, :password]
    )
  end

end
