class AdminDashboard

  def initialize(user)
    @user = user
  end

  def organization
    @user.organization
  end

  def weekly_scraps
    scraps.sum(:weight)
  end

  def credits_redeemed
    debits.sum(:value)
  end

  def client_signups
    new_clients.count
  end

  def member_since
    @user.created_at.strftime("%B %Y")
  end

  def chart_dates
    last_4_weeks.map{ |date| date.strftime("%b %d") }.to_json.html_safe
  end

  def active_clients
    [week4, week3, week2, week1].to_json.html_safe
  end

  def locations
    Location.where(organization_id: @user.organization)
  end

  def location_scraps(location)
    Scrap.where(created_at: Time.now-28.days..Time.now, location_id: location).sum(:weight)
  end

  private

  def today
    Time.now.to_date
  end

  def last_4_weeks
    (22.days.ago.to_date..today).step(7)
  end

  def week1
    @clients = Scrap.where(created_at: Time.now-7.days..Time.now).map{ |scrap| scrap.client_id }
    Client.where(id: @clients, organization_id: @user.organization_id).count
  end

  def week2
    @clients = Scrap.where(created_at: Time.now-14.days..Time.now-7.days).map{ |scrap| scrap.client_id }
    Client.where(id: @clients, organization_id: @user.organization_id).count
  end

  def week3
    @clients = Scrap.where(created_at: Time.now-21.days..Time.now-14.days).map{ |scrap| scrap.client_id }
    Client.where(id: @clients, organization_id: @user.organization_id).count
  end

  def week4
    @clients = Scrap.where(created_at: Time.now-28.days..Time.now-21.days).map{ |scrap| scrap.client_id }
    Client.where(id: @clients, organization_id: @user.organization_id).count
  end

  def scraps
    Scrap.where(created_at: Time.now-28.days..Time.now, client_id: clients)
  end

  def debits
    Debit.where(created_at: Time.now-28.days..Time.now, client_id: clients)
  end

  def new_clients
    Client.where(created_at: Time.now-28.days..Time.now, organization_id: @user.organization_id)
  end

  def clients
    Client.where(organization_id: @user.organization_id)
  end
end
