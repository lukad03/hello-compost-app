class ScrapsController < ApplicationController
  respond_to :html, :json

  def index
    @scraps = Scrap.all
  end

  def new
    @location = Location.where(name: params[:location_name]).first
    @scrap = Scrap.new
    @clients = Client.where(location_id: @location.id).collect {|x| [x.username, x.id]}
  end

  def create
    @convert = ScrapToCredit.convert(scrap_params)
    if @convert == true
      flash[:success] = 'Woohoo! It saved!'
      redirect_to client_path(client)
    else
      flash[:error] = 'The scrap failed to save.'
      redirect_to new_location_scrap_path
    end
  end

  private

  def client
    Client.find(scrap_params[:client_id])
  end

  def scrap_params
    params.require(:scrap).permit(:weight, :client_id)
  end

end
