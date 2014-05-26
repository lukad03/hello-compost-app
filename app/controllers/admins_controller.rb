class AdminsController < ApplicationController

  def new
    @admin = Admin.new
    @organization = Organization.new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @admin = Admin.create(admin_params)
    @user.rolable = @admin
    if @admin.save
      sign_in_and_redirect @user
    else
      flash[:error] = 'Your account failed to create'
    end
  end

  private

  def admin_params
    params.require(:admin).permit(
      :name,
      :organization_id,
      user_attributes: [:email, :id, :password],
      organization_attributes: [:id, :name]
    )
  end
end
