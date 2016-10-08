class PhotosController < ApplicationController

	def create
		@photo = Photo.new(photo_params)
		if @photo.save
			redirect_to photo_path(@photo)
		end
	end

	def new
		@photo = Photo.new
	end

	def show
		@photo = Photo.find(params[:id])
		@asker = Asker.new
	end

	private
	def photo_params
		params.require(:photo).permit(:img, :asker_id)
		
	end
end
