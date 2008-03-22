class Post < ActiveRecord::Base
  # Make this model taggable
  acts_as_taggable
  
  # Create the permalink
  has_permalink :title
  
  # Model Associations
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :comments
  
  # Before it saves let's see if there is an archive for this month, if not add one.
  before_create :make_archive
  
  def to_param
  	permalink
  end
  
  protected  
  # Method to add an existing archive or create a new one.
  def make_archive    
    if @a = Archive.find(:first, :conditions => ["month = ? and year = ?", Time.now.strftime('%B'), Time.now.strftime('%Y')])      
      self.archive_id = @a.id    
    else      
      @a = Archive.create(:month => Time.now.strftime('%B'), :year => Time.now.strftime('%Y'))      
      self.archive_id = @a.id
    end
  end
  
  def self.published(page)
  	paginate :per_page => 10, :page => page,
  			 :conditions => [ "publish = ?", true ],
  			 :order => "created_at DESC"
  end
end
