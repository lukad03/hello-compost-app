class ClientsController < ApplicationController
  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      flash[:success] = "You're officially a composter!"
      redirect_to client_path(@client)
    else
      flash[:error] = "Something went wrong. Please try again."
      render :new
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
    @_location ||= Location.where(name: params[:name]).first
  end

  def client_params
    params[:client].require(:username).
    merge(organization_id: current_user.rolable.organization,
          location_id: location.id)
  end
end
