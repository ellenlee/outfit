class Admin::PhotosController < ApplicationController
	layout "admin"

	def index
		@photos = Photo.all
	end
end
