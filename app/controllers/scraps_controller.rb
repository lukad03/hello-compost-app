class ScrapsController < ApplicationController
  respond_to :html, :json

  def index
    @scraps = Scrap.all
  end

  def new
    @location = Location.where(name: params[:name]).first
    @scrap = Scrap.new
    @scrap.build_client
  end

  def create
    @convert = ScrapToCredit.convert(scrap_params)
    if @convert == true
      flash[:success] = 'Woohoo! It saved!'
      redirect_to new_location_scrap_path
    else
      flash[:error] = 'The scrap failed to save.'
      redirect_to new_location_scrap_path
    end
  end

  private

  def scrap_params
    params.require(:scrap).permit(:weight, :client_id)
  end

end
