class AdminDashboard

  def initialize(user)
    @user = user
  end

  def weekly_scraps
    binding.pry
    Scrap.where(created_at: last_week, client_id: clients).sum(:value)
  end

  def weekly_visits
    clients.scraps.where(created_at: last_week).count
  end

  def member_since
    @user.created_at.strftime("%B %Y")
  end

  def organization
    @user.organization
  end

  private

  def clients
    Client.where(organization_id: @user.organization_id)
  end

  def last_week
    1.week.ago..Time.now
  end
end
