class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role?(:admin)
      can :manage, :all

    elsif user.has_role?(:supervisor)
      can %i[index update comment], Issue
      %w[accepted reviewed rejected].each { |status| can "make_#{status}".to_sym, Issue }
      can :create, Comment

    elsif user.has_role?(:hostel_supervisor, :any)
      can %i[index update comment], Issue,
          building_id: Building.with_role(:hostel_supervisor, user).map(&:id),
          status: %w[reviewed in_work closed rejected].map { |s| Issue.statuses[s] }
      %w[reviewed in_work closed rejected].each { |status| can "make_#{status}".to_sym, Issue }
      can :create, Comment
    end

    can :create, Issue
    can :show, Issue
    can :stats, Issue

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
