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
      redirect_to admin_dashboard_path
    else
      flash[:error] = 'The location failed to save'
      redirect_to new_location_path
    end
  end

  def edit
    @location = Location.where(name: params[:name]).first
  end

  def update
    @location = Location.find(params[:name])
    if @location.update_attributes(location_params)
      redirect_to location_path(@location.name)
    else
      redirect_to edit_location_path(@location.name)
    end
  end

  def destroy
    @location = Location.where(name: params[:name]).first
    if @location.destroy
      flash[:success] = "Location destroyed."
    else
      flash[:error] = "Unable to destroy location."
    end
    redirect_to admin_dashboard_path
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
