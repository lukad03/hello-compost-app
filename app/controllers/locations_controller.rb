class LocationsController < ApplicationController

  load_and_authorize_resource skip_load_resource only: [:new, :create]

  def index
    @locations = Location.all
  end

  def show
    @location = Location.where(name: params[:name]).first
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

  private

  def location_params
    params.require(:location)
    .permit(:name, :address, :longitude, :latitude, :organization_id)
    .merge(organization_id: current_organization.id)
  end
end
