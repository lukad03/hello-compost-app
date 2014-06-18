class ClientsController < ApplicationController
  def new
    @location = location
    @client = @location.clients.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      flash[:success] = "Client Added"
      redirect_to location_path(location.name)
    else
      flash[:error] = "Something went wrong. Please try again."
      redirect_to location_client_new_path(location.name)
    end
  end

  def show
    @client = client
    @scraps = Scrap.where(client_id: client)
  end

  private

  def client
    @_client ||= Client.find(params[:id])
  end

  def client_credits
    Credit.where(client_id: client).sum(:value)
  end
  helper_method :client_credits

  def location
    Location.find_by_name(params[:location_name])
  end

  def client_params
    params.require(:client).permit(:username, :location_name).
    merge(organization_id: current_user.rolable.organization)
  end
end