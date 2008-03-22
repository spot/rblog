class ArchivesController < ApplicationController
	# This is a pretty simple controller just to collect and view archives. No modification should be
	# necassary as this would defeat the purpose of archiving posts.
	
	# This will find all of the archives
	def index
		@archives = Archive.find_all
	end
	
end
