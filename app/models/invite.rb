class Invite < ActiveRecord::Base
  belongs_to :organization

  def invited?
    !!self.invited_at
  end

  def invite!
    self.invited_at = Time.now.utc
    self.save!
  end

  def self.find_redeemable(email)
    self.find(:first, :conditions => {:redeemed_at => nil, :email => email})
  end

  def redeemed!
    self.redeemed_at = Time.now.utc
    self.save!
  end

end
