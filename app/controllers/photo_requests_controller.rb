class PhotoRequestsController < ApplicationController
	def create
		ids = Array(params[:ids])
		options = ids.map{ |i| Option.find_by_id(i) }.compact

		@photo = Photo.find(params[:photo])
		if @photo.options << options
			redirect_to new_photo_asker_path(@photo)
		else
			redirect_to :back, alert: "#{已經登錄過了哦}"
		end
		
	end
end
