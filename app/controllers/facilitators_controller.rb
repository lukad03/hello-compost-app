class FacilitatorsController < ApplicationController
  before_filter :new, only: [:new, :create]
  load_and_authorize_resource
  skip_load_resource only: [:new, :create]

  def show
    @facilitator = Facilitator.find(params[:id])
    @locations = @facilitator.locations
  end

  def new
    @facilitator = Facilitator.new
    @user = User.new
  end

  def create
    @facilitator = new_facilitator
    @invite = find_invite(@facilitator.user.email)

    if @invite
      if @facilitator.save
        @invite.redeemed!
        facilitator_locations(@facilitator.id)
        flash[:success] = 'Welcome!'
        sign_in_and_redirect @facilitator.user
      else
        flash[:error] = "Your account failed to create"
        redirect_to new_organization_facilitator_path(organization)
      end
    else
      flash[:error] = "You haven't been invited by this organization"
      redirect_to root_path
    end
  end

  def edit
    @organization = Organization.find_by(params[:name])
    @facilitator = Facilitator.find(params[:id])
  end

  def update
    @facilitator = Facilitator.find(params[:id])
    if @facilitator.update_attributes(facilitator_params)
      flash[:success] = "Facilitator updated"
      redirect_to organization_facilitator_path(current_organization.name, @facilitator)
    else
      flash[:error] = "Update failed"
      redirect_to facilitator_path(current_organization, @facilitator)
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

  def find_invite(email)
    Invite.where(redeemed_at: nil, email: email, organization_id: organization.id).first
  end

  def facilitator_locations(facilitator)
    invite_locations.each do |location|
      FacilitatorLocation.create(location_id: location.location_id, facilitator_id: facilitator)
    end
  end

  def facilitator_params
    params.require(:facilitator)
    .permit(:name, :organization_name, location_ids: [],
                   user_attributes: [:email, :id, :password,
                                     :password_confirmation])
    .merge(organization_id: organization.id)
  end

end
