class Ability
  include CanCan::Ability

  def initialize(user)

    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)

    if user.has_role?(:admin)
      can :manage, :all
    else
      can :read, :all
      if user.has_role?(:editor)
        can :edit, :user_id => user.id
      end
    end
  end

end
