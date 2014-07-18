class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.all
  end

  def show
    @organization = Organization.where(name: params[:name]).first
    @locations = @organization.locations
  end

  def edit
    @organization = Organization.where(name: params[:name]).first
  end

  def update
    @organization = Organization.where(name: params[:name]).first
    if @organization.update_attributes(organization_params)
      respond_with @organization
    else
      render :edit
    end
  end

  private

  def organization_params
    params.require(:organization).permit(:name)
  end

end
