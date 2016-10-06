class PhotosController < ApplicationController

	def create
		@photo = Photo.new(photo_params)
		if @photo.save

		end
		respond_to do |format|
	    format.js  {render :template => 'photos/photo'}
	    # format.html  { render :root }
	  end
	end

	private
	def photo_params
		params.require(:photo).permit(:img)
		
	end
end
