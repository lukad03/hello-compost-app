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
    @organization = Organization.find(params[:name])
    if @organization.update_attributes(organization_params)
      redirect_to admin_dashboard_path
    else
      redirect_to edit_organization_path(@organization.name)
    end
  end

  private

  def organization_params
    params.require(:organization).permit(:name)
  end

end
