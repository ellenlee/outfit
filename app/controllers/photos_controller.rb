class PhotosController < ApplicationController
	# before_action :set_asker

	def new
		@photo = Photo.new
	end

	def create
		set_asker
		@photo = @asker.photos.new(photo_params)
		if @photo.save
			redirect_to asker_photo_path(@asker, @photo, page: 'note')
		else
			redirect_to new_asker_photo_path(@asker), alert: "麻煩再試一次，提醒您只接受圖片哦"
		end
	end

	def show
		set_asker
		@photo = @asker.photos.find(params[:id])
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
