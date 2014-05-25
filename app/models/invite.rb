class Invite < ActiveRecord::Base

  #validates_presence_of :email, :on => :save, :message => "can't be blank"
  #validates_uniqueness_of :email, :on => :save, :message => "is already registered"

  #named_scope :unsent_invitations, :conditions => {:redeemed_at => nil}

  #def invited?
    #!!self.invited_at
  #end

  #def invite!
    #self.invited_at = Time.now.utc
    #self.save!
  #end

  #def self.find_redeemable(email)
    #self.find(:first, :conditions => {:redeemed_at => nil, :email => email})
  #end

  #def redeemed!
    #self.redeemed_at = Time.now.utc
    #self.save!
  #end

end
