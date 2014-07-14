class Invite < ActiveRecord::Base
  belongs_to :organization

  has_many :invite_locations
  has_many :locations, through: :invite_locations

  validates :email, presence: true, uniqueness: true
  validates :organization, presence: true

  def invited?
    !!self.invited_at
  end

  def invite!
    self.invited_at = Time.now.utc
    self.save!
  end

  def redeemed!
    self.update(redeemed_at: Time.now.utc)
  end
end
