module AuthenticationHelper
  def sign_in_admin
    @request.env["devise.mapping"] = Devise.mappings[:user]
    admin = create(:admin, :with_organization)
    user = create(:user, rolable_type: 'Admin', rolable_id: admin)
    sign_in user
  end
end
