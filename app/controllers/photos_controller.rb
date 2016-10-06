class PhotosController < ApplicationController

	def create
		@photo = Photo.new(photo_params)
		if @photo.save
			redirect_to :root, notice: "感謝您的上傳！"
		end
	end

	private
	def photo_params
		params.require(:photo).permit(:img)
		
	end
end
