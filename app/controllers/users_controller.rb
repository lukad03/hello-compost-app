class UsersController < Devise::SessionsController

  def show
    @user = User.where(username: params[:username]).first
    @total_credits = total_credits(@user)
    @scraps = total_scraps(@user)
  end

  private

  def total_credits(user)
    Credit.where(user_id: user).sum(:value)
  end

  def total_scraps(user)
    Scrap.where(user_id: user).sum(:weight)
  end

end
