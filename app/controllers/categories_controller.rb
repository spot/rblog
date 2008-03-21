class CategoriesController < ResourceController::Base
  # We only need the index and show actions
  actions :all, :except => [:new, :edit, :create, :update, :destroy]
  
  index.before { @meta_title = "Categories - ",
    						 @meta_description = "Full listing of all categories" }
    								
  show.before { @meta_title = "#{@object.name} - ",
  							@meta_description = "List of posts in the #{@object.name} category." }
end
