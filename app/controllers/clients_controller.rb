class ClientsController < ApplicationController
  def index
    @clients = current_organization.clients
  end


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

  def available_credits
    existing_credits - existing_debits
  end
  helper_method :available_credits

  def existing_credits
    Credit.where(client_id: client).sum(:value)
  end

  def existing_debits
    Debit.where(client_id: client).sum(:value)
  end

  def location
    Location.find_by_name(params[:location_name])
  end

  def client_params
    params.require(:client).permit(:username, :location_name).
    merge(organization_id: current_user.rolable.organization.id,
          location_id: location.id)
  end
end
