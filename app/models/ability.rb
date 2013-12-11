class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
        can :manage, :all
    else #if user.tester? or user.developer?
        can :read, Device
        can :write, Device
        can :mark_as_unavailable, Device
        can :mark_as_available, Device, :user_id => user.id
        can :read, Project
        can :read, User
        cannot :write, User
    end
  end

  def as_json
    abilities = []
    rules.each do |rule|
      abilities << { can: rule.base_behavior, actions: rule.actions.as_json, subjects: rule.subjects.map(&:to_s), conditions: rule.conditions.as_json }
    end
    abilities.to_json 
  end
end
