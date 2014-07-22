class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new
    can :read, Idea
    can :manage, Idea, user_id: user.id
    
  end
end
