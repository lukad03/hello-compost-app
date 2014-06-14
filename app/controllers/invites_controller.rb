class InvitesController < ApplicationController
  def new
    @organization = organization
    @invite = Invite.new
  end

  def create
    @invite = InviteBuilder.new(invite_params)
    if @invite
      flash[:success] = 'Invitation sent!'
      redirect_to organization_path(current_organization.name)
    else
      flash[:error] = 'Your invite failed to send.'
      redirect_to new_organization_invite_path(current_organization.name)
    end
  end

  private

  def locations
    organization.locations
  end
  helper_method :locations

  def email_invite(recipient)
    Mailer.invitation(recipient).deliver
  end

  def new_invite(invite_params)
     @_new_invite ||= Invite.new(invite_params)
  end

  def organization
    Organization.find_by(name: params[:organization_name])
  end

  def invite_params
    params.require(:invite)
    .permit(:email, location_ids: [])
    .merge(organization_id: current_organization.id)
  end

end
