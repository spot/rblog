class PostsController < ResourceController::Base
	actions :all, :except => [:create, :destroy, :new, :update]
	index.before { @truncate = true,
								 @meta_title = "Most Recent Posts - " }
	show.before {@truncate = false,
							 @meta_title = "#{@object.title} - ",
							 @meta_keywords = @object.tags.collect { |tag| tag.name }.join(', '),
							 @meta_description = awesome_truncate(@object.body, 200, "") }
	
	def tag
		@posts = Post.find_tagged_with(params[:id])
	end
	
	private
	
	def collection
		@collection ||= end_of_association_chain.published(params[:page])	
	end
	
	def object
        @object ||= end_of_association_chain.find_by_permalink(params[:id])
	end
end
