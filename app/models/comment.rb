class Comment < ActiveRecord::Base
  	#Model Associations
  	belongs_to :post
  
  	before_create :check_for_spam

	def request=(request)
	  self.user_ip    = request.remote_ip
	  self.user_agent = request.env['HTTP_USER_AGENT']
	  self.referrer   = request.env['HTTP_REFERER']
	end
	
	def check_for_spam
	  self.approved = !Akismetor.spam?(akismet_attributes)
	  true # return true so it doesn't stop save
	end
	
	def akismet_attributes
	  {
	    :key                  => 'e5a054863323',
	    :blog                 => 'http://nu2rails.com',
	    :user_ip              => user_ip,
	    :user_agent           => user_agent,
	    :comment_author       => name,
	    :comment_author_email => email,
	    :comment_author_url   => url,
	    :comment_content      => comment
	  }
	end
	
	def mark_as_spam!
	  update_attribute(:approved, false)
	  Akismetor.submit_spam(akismet_attributes)
	end
	
	def mark_as_ham!
	  update_attribute(:approved, true)
	  Akismetor.submit_ham(akismet_attributes)
	end
	
	def self.approved
		find(:all, :conditions => [ "approved = ?", true ])
	end
end
