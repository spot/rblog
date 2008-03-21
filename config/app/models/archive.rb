class Archive < ActiveRecord::Base
  has_many :posts
  
  def self.find_all
    find(:all, :order => "id ASC")
  end
end
