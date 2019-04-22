class Role < ApplicationRecord
  has_many :permissions
  has_many :user_role
  has_many :users , through: :user_role
end
