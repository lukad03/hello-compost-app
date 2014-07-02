class AdminsController < ApplicationController

  def new
    @admin = Admin.new
    @organization = Organization.new
    @user = User.new
  end

  def create
    @admin = Admin.create(admin_params)
    if @admin.save
      sign_in_and_redirect @admin.user
    else
      flash[:error] = 'Your account failed to create'
      render :new
    end
  end

  private

  def admin_params
    params.require(:admin).permit(
      :name,
      organization_attributes: [:id, :name],
      user_attributes: [:email, :id, :password, :organization_id]
    )
  end

end
