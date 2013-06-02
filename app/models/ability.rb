class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_mod
      can :manage, :all
    else
      can :manage, User, id: user.id
    end
  end
end
