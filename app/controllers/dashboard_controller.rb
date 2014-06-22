class DashboardController < ApplicationController

  def admin
    @admin = AdminDashboard.new(current_user.rolable)
  end

  def facilitator
    @facilitator = FacilitatorDashboard.new(current_user)
  end
end
