class FacilitatorDashboard

  def initialize(user)
    @user = user
  end

  def organization
    @user.organization
  end

  def weekly_scraps
    scraps.sum(:weight)
  end

  def weekly_visits
    scraps.count
  end

  def member_since
    @user.created_at.strftime("%B %Y")
  end

  def managed_locations
    @user.locations
  end

  private

  def scraps
    Scrap.where(created_at: last_week, client_id: clients)
  end

  def clients
    Client.where(organization_id: @user.organization_id, location_id: managed_locations)
  end

  def last_week
    1.week.ago..Time.now
  end
end
