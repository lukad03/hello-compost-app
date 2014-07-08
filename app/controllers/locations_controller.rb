class LocationsController < ApplicationController

  load_and_authorize_resource skip_load_resource only: [:new, :create]

  def index
    @locations = Location.where(organization_id: organization)
  end

  def show
    @location = Location.where(name: params[:name]).first
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      flash[:success] = 'Location added'
      redirect_to locations_path
    else
      flash[:error] = 'The location failed to save'
      redirect_to new_location_path
    end
  end

  private

  def organization
    current_user.rolable.organization
  end

  def location_params
    params.require(:location)
    .permit(:name, :address, :hours, :longitude, :latitude, :organization_id)
    .merge(organization_id: current_organization.id)
  end
end
