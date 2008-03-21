class LinksController < ResourceController::Base
	actions :all, :except => [:new, :create, :edit, :update, :destroy]
end
