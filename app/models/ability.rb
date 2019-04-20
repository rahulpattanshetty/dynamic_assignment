# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      can :read, ModelList
    elsif user.role == "admin"
      can :manage, :all
    else

    end  
  end

  def set_abilities(user)
    user.role.permissions.each do |permission|

      
    end
    
  end
  
end
