class OrganizationsController < ApplicationController

  def index
    @organizations = Organization.all
  end

  def show
    @organization = Organization.where(name: params[:name]).first
    @locations = @organization.locations
  end

end
