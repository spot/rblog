class SearchesController < ApplicationController
	def index
		if params[:q]
		query = params[:q]
			@posts = Post.find_with_ferret query, :page => params[:page], :per_page => 10
		end
	end
end
