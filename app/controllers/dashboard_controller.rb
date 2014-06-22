class DashboardController < ApplicationController

  def admin
    @admin = AdminDashboard.new(current_user.rolable)
  end
end
