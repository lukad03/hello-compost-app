class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end
  def new
    @location = Location.new
  end

  def create
    @location = Location.create(location_params)
    if @location.save
      flash[:success] = 'Location added'
      redirect_to locations_path
    else
      flash[:error] = 'The location failed to save'
      redirect_to new_location_path
    end
  end

  def show
    @location = Location.find(params[:id])
    @users = @location.users
  end

  private

  def location_params
    params.require(:location).permit(:name, :address, :longitude, :latitude, :organization_id)
  end
end
