class ApplicationController < ActionController::Base
	# Load default meta information
	before_filter :meta_defaults
	helper_method :awesome_truncate
	
	# AuthenticatedSystem must be included for RoleRequirement, and is provided by installing acts_as_authenticates and running 'script/generate authenticated account user'.
	include AuthenticatedSystem
	# You can move this into a different controller, if you wish.  This module gives you the require_role helpers, and others.
	include RoleRequirementSystem
		
	helper :all # include all helpers, all the time
		
	# See ActionController::RequestForgeryProtection for details
	# Uncomment the :secret if you're not using the cookie session store
	protect_from_forgery # :secret => '57fef62137e8687e314a87b43ba65196'
		  
	private
	# Default meta information
	def meta_defaults
		@meta_title = "Welcome to "
	 	@meta_description = "A novice programmers views and adventures with ruby on rails."
	  @meta_keywords = "ruby, ruby on rails, rails, programming, scripting"  	
	end
	# Awesome truncate
	# First regex truncates to the length, plus the rest of that word, if any.
	# Second regex removes any trailing whitespace or punctuation (except ;).
	# Unlike the regular truncate method, this avoids the problem with cutting
	# in the middle of an entity ex.: truncate("this &amp; that",9)  => "this &am..."
	# though it will not be the exact length.
	def awesome_truncate(text, length = 30, truncate_string = "...")
	  return if text.nil?
	  l = length - truncate_string.chars.length
	  text.chars.length > length ? text[/\A.{#{l}}\w*\;?/m][/.*[\w\;]/m] + truncate_string : text
	end
end
