class PhotosController < ApplicationController
	before_action :set_asker

	def new
		@photo = @asker.photos.new
	end

	def create
		@photo = @asker.photos.new(photo_params)
		if @photo.save
			redirect_to asker_photo_path(@asker, @photo)
		end
	end

	def show
		@photo = Photo.find(params[:id])
		@request = @photo.requests.build
		@options = Option.all
	end

	private
	def set_asker
		@asker = Asker.find(params[:asker_id])
	end

	def photo_params
		params.require(:photo).permit(:img, :asker_id)
	end
end
