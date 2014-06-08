class FacilitatorsController < ApplicationController

  def new
    @facilitator = Facilitator.new
    @user = User.new
  end

  def create
    @organization = Organization.where(name: params[:name]).first
    @facilitator = Facilitator.create(facilitator_params)
    if @facilitator.save
      sign_in_and_redirect @facilitator.user
    else
      flash[:error] = 'Your account failed to create'
    end
  end

  private

  def facilitator_params
    params.require(:facilitator).permit(
      :name, :organization_id,
      user_attributes: [:email, :id, :password, :organization_id]
    )
  end

end
