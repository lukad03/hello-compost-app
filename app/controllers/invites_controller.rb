class InvitesController < ApplicationController
  def new
    @organization = Organization.find_by(name: params[:organization_name])
    @invite = Invite.new
  end

  def create
    @invite = Invite.new(invite_params)
    if @invite.invite!
      mail_invite(@invite)
      flash[:success] = 'Invitation sent!'
      redirect_to organization_path(current_organization.name)
    else
      flash[:error] = 'Your invite failed to send.'
      redirect_to new_organization_invite_path(current_organization.name)
    end
  end

  private

  def mail_invite(invite)
    InviteMailer.send_invite(invite).deliver
  end

  def locations
    organization.locations
  end
  helper_method :locations

  def organization
    Organization.find_by_name(params[:organization_name])
  end

  def invite_params
    params.require(:invite)
    .permit(:email, location_ids: [])
    .merge(organization_id: current_organization.id)
  end

end
