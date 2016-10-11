class Admin::PhotosController < Admin::AdminController
	

	def index
		@photos = Photo.all
	end

	def bulk_update
		ids = Array(params[:ids])
		photos = ids.map{ |i| Photo.find_by_id(i) }.compact

		if params[:commit] == "Delete"
			photos.each { |photo| photo.destroy }
		end

		redirect_to admin_photos_path
	end


end
