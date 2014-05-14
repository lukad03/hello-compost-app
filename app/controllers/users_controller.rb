class UsersController < Devise::SessionsController
  def create
    super
  end

  def show
    @user = User.where(username: params[:username]).first
    @total_credits = total_credits(@user)
    @scraps = Scrap.where(user_id: @user)
  end

  private

  def total_credits(user)
    Credit.where(user_id: user).sum(:value)
  end

end
