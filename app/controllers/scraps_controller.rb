class ScrapsController < ApplicationController

  def index
    @scraps = Scrap.all
  end

  def new
    @scrap = Scrap.new
    @users = User.where('username' => true)
  end

  def create
    @scrap = Scrap.create(scrap_params)
    if @scrap.save
      flash[:success] = 'Scrap saved'
      redirect_to scraps_path
    else
      flash[:error] = 'The scrap failed to save'
      redirect_to new_scrap_path
    end
  end

  private

  def scrap_params
    params.require(:scrap).permit(:weight, user_attributes: [ :id, :username])
  end
end
