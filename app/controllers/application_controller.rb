class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_organization
    current_user.rolable.organization
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end

  def after_sign_in_path_for(resource)
    case current_user.rolable_type
    when "Admin"
      unless (current_user.sign_in_count == 1)
        return admin_dashboard_path
      else
        return walkthrough_intro_path
      end
    when "Facilitator"
      unless (current_user.sign_in_count == 1)
        return facilitator_dashboard_path
      else
        return walkthrough_intro_path
      end
    when "Client"
      return user_path(current_user)
    end
  end

  def after_update_path_for(resource)
    case current_user.rolable_type
    when "Admin"
      return admin_dashboard_path
    when "Facilitator"
      return facilitator_dashboard_path
    end
  end
end
