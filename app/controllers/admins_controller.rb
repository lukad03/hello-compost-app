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

  def edit
    @admin = current_user.rolable
  end

  def update
    @admin = current_user.rolable
    @user = User.find(current_user.id)
    if needs_password?(@user, admin_params)
      if @admin.update_attributes(update_admin_params)
        sign_in @admin.user, bypass: true
        redirect_to admin_dashboard_path
      else
        flash[:error] = "Your user information failed to update"
        render :edit
      end
    else
      if @admin.update_attributes(update_admin_without_user_params)
        redirect_to admin_dashboard_path
      else
        flash[:error] = "Your name failed to update"
        render :edit
      end
    end
  end


  private

  def admin_params
    params.require(:admin).permit(
      :name,
      organization_attributes: [:id, :name],
      user_attributes: [:email, :id, :password, :password_confirmation, :organization_id]
    )
  end

  def update_admin_params
    params.require(:admin).permit(:name, user_attributes: [:email, :id, :password])
  end

  def update_admin_without_user_params
    params.require(:admin).permit(:name)
  end

  def needs_password?(user, params)
    user.email != params[:user_attributes][:email] || params[:user_attributes][:password].present?
  end

end
