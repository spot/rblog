class CommentsController < ResourceController::Base
  
	def create
	  @comment = Comment.new(params[:comment])
	  @comment.request = request
	  respond_to do |format|
	  if @comment.save
	    if @comment.approved?
	      flash[:notice] = "Thanks for the comment."
	    else
	      flash[:error] = "Unfortunately this comment is considered spam by Akismet. " + 
	                      "It will show up once it has been approved by the administrator."
	    end
	    format.html {redirect_to post_path(@comment.post.permalink)}
	    format.js
	  else
	    format.html {render :action => 'new'}
	  end
  	end
	end
	
	def destroy_multiple
	  Comment.destroy(params[:comment_ids])
	  flash[:notice] = "Successfully destroyed comments."
	  redirect_to comments_path
	end
	
	def approve
	  @comment = Comment.find(params[:id])
	  @comment.mark_as_ham!
	  redirect_to comments_path
	end
	
	def reject
	  @comment = Comment.find(params[:id])
	  @comment.mark_as_spam!
	  redirect_to comments_path
	end

end
