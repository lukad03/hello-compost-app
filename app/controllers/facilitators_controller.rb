class FacilitatorsController < ApplicationController

  def new
    @facilitator = Facilitator.new
    @user = User.new
  end

  def create
    @facilitator = new_facilitator
    @facilitator.organization = organization
    if @facilitator.save
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
    Facilitator.create(facilitator_params)
  end

  def facilitator_params
    params.require(:facilitator).permit(
      :name, :organization_name,
      user_attributes: [:email, :id, :password]
    )
  end

end
