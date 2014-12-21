class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if !user.new_record?
      if user.is_admin?
        can :manage, :all
      else

      end
    else
      # I want to avoid using :all for security reasons (whitelist models instead)
      can :read, []
    end
  end
end
