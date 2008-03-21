class Admin::PostsController < ResourceController::Base
  # We want to make sure only admins can access any methods here
  before_filter :login_required
  require_role "admin"
  cache_sweeper :category_sweeper, :only => [:create, :update, :destroy]
  cache_sweeper :archive_sweeper, :only => [:create, :update, :destroy]
  
  create.before do 
  	object.user_id = current_user.id
  end
  
	private
	
	def object
        @object ||= end_of_association_chain.find_by_permalink(params[:id])
	end
  	
end