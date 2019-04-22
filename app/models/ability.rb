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
      if permission.is_read
        can :read, permission.model_list.name.constantize
      end
      if permission.is_create
        can :create, permission.model_list.name.constantize
      end
      if permission.is_update
        can :update, permission.model_list.name.constantize
      end
      if permission.is_destroy
        can :destroy, permission.model_list.name.constantize
      end
    end  
  end
  
end
