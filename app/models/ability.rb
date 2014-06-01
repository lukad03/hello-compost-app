class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.rolable_type == "Admin"
        can :manage, Organization, :id => user.rolable.organization_id
        can :manage, Credit
        can :manage, Location, :organization_id => user.rolable.organization_id
        can :manage, Scrap
        can :manage, User, :location_id => user.rolable.organization.locations
    elsif user.rolable_type == "Facilitator"
        can :manage, User, :location_id => user.rolable.organization.locations
    elsif user.rolable_type == "Client"
        can :manage, User, id: user.id
        can :read, Location
    end
  end
end
