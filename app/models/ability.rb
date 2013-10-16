class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    unless user.guest?
      can :manage, Project, user_id: user.id
      can :manage, Task do |task|
        task.project.user == user
      end
    end
  end
end
