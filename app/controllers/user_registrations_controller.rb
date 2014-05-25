class UserRegistrationsController < Devise::RegistrationsController
  before_filter :permit_organization_params

  def create
    # Getting the user type that is sent through a hidden field in the registration form.
    user_type = params[:user][:user_type]

    # Deleting the user_type from the params hash, won't work without this.
    params[:user].delete(:user_type)

    # Building the user
    build_resource

    # create a new child instance depending on the given user type
    child_class = user_type.camelize.constantize
    resource.rolable = child_class.new(params[child_class.to_s.underscore.to_sym])

    # first check if child instance is valid
    # cause if so and the parent instance is valid as well
    # it's all being saved at once

    valid = resource.valid?
    valid = resource.rolable.valid? && valid

    if user_type == 'admin'
      @organization = Organization.create(organization_params)
    end

    if valid && resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :inactive_signed_up, :reason => inactive_reason(resource) if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords(resource)
      respond_with resource
    end

  end

  private

  def permit_organization_params
    devise_parameter_sanitizer.for(:sign_up) do |admin_params|
      admin_params.permit(
        :email,
        :password,
        :user_type,
        organization_attributes: [:name]
      )
    end
  end

  def organization_params
    params.require(:organization).permit(:name)
  end

end
