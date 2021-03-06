class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
      can :invite, User
    else
      can :read, :all
    end
  end
end
