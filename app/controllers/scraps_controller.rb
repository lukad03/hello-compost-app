class ScrapsController < ApplicationController
  respond_to :html, :json

  def index
    @scraps = Scrap.all
  end

  def new
    @scrap = Scrap.new
    @scrap.build_user
  end

  def create
    @convert = ScrapToCredit.convert(scrap_params)
    if @convert == true
      redirect_to scraps_path
    else
      flash[:error] = 'The scrap failed to become a credit'
      redirect_to new_scrap_path
    end
  end

  private

  def scrap_params
    params.require(:scrap).permit(:weight, :user_id)
  end

end
