class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end

    if (user.human_name == "Todd Sedano" || user.human_name == "Brian Drummond" || user.human_name == "Cecile Peraire" || user.human_name == "Patricia Collins" || user.human_name == "Ed Katz" ||user.human_name == "Massood Mortazavi" || user.human_name == "Gladys Mercier")
      can :update, PageAttachment
    #else
    #  cannot :update, PageAttachment
    end

    if (user.human_name == "Todd Sedano" ||user.human_name == "Chris Zeise" || user.human_name == "Gerry Elizondo")
      can :upload, HUBClassRosterHandler
    end

    can :manage, User, :id => user.id

    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
