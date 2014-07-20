module ApplicationHelper
  def my_devise_error_messages!
    return "" if resource.errors.empty? && resource.rolable.errors.empty?

    messages = rolable_messages = ""

    if !resource.errors.empty?
      messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    end

    if !resource.rolable.errors.empty?
      rolable_messages = resource.rolable.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    end

    messages = messages + rolable_messages
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count + resource.rolable.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation">
    <h2>#{sentence}</h2>
    <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end

  def organization_name
    current_user.rolable.organization.name
  end

  def organization_locations
    current_organization.locations
  end

  def organization_facilitators
    current_organization.facilitators
  end

  def organization_invites
    current_organization.invites.where(redeemed_at: nil)
  end

  def current_organization
    current_user.rolable.organization
  end

  def signup_steps
    if !organization_locations.exists?
      "no-locations"
    elsif !current_organization.clients.exists?
      "no-clients"
    elsif !organization_facilitators.exists?
      "no-facilitators"
    end
  end

  def current_page(path)
  "current" if current_page?(path)
  end

end
