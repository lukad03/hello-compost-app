class Invite < ActiveRecord::Base
  belongs_to :organization

  has_many :invite_locations
  has_many :locations, through: :invite_locations

  validates :email, presence: true, uniqueness: true
  validate :existing_facilitator
  validates :organization, presence: true

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

  private

  def existing_facilitator
    if User.where(email: email).any?
      errors.add(:email, :in_use)
    end
  end

end
