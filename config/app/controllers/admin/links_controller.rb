class Admin::LinksController < ResourceController::Base
	before_filter :login_required
  require_role "admin"
end
