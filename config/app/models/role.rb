class Role < ActiveRecord::Base
  # Model Associations
  has_and_belongs_to_many :users
  
end