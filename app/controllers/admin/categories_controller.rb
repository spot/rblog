class Admin::CategoriesController < ResourceController::Base
  # We want to make sure only admins can access any methods here
  before_filter :login_required
  require_role "admin"
  cache_sweeper :category_sweeper, :only => [:create, :update, :destroy]
end
