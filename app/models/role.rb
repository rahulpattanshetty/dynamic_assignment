class Role < ApplicationRecord
  has_many :permissions, dependent: :destroy
  has_many :user_role, dependent: :destroy
  has_many :users , through: :user_role

  after_create :create_permissions


  def create_permissions    
    ModelList.all.each do |m|
      p = Permission.new
      p.role_id = self.id
      p.model_list_id = m.id
      p.save
    end
  end
  
end
