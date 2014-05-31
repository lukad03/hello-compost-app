class LocationsController < ApplicationController
  load_and_authorize_resource

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.create(location_params)
    @location.organization = current_organization
    if @location.save
      flash[:success] = 'Location added'
      redirect_to locations_path
    else
      flash[:error] = 'The location failed to save'
      render :new
    end
  end

  def show
    @location = Location.where(name: params[:name]).first
  end

  private

  def current_organization
    @_organization ||= current_user.rolable.organization
  end

  def location_params
    params.require(:location).permit(:name, :address, :longitude, :latitude, :organization_id)
  end
end
