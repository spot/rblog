class Category < ActiveRecord::Base
  # Model Associations
  has_and_belongs_to_many :posts
  
  def self.find_sort
    find(:all, :order => "sort ASC")
  end
end
