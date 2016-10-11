class PhotoAskersController < ApplicationController
	before_action :set_photo

	def new
		@asker = Asker.new
	end

	def create
		@asker = Asker.find_or_initialize_by(asker_params)
		@asker.photos << @photo
		@asker.ask_count += 1
		
		if @asker.save
			redirect_to thanks_path
		else
			redirect_to new_photo_asker_path(@photo), alert: "#{@asker.errors.full_messages.to_sentence}, #{@photo.errors.full_messages.to_sentence}"
		end
	end

	private

	def set_photo
		@photo = Photo.find(params[:photo_id])
		
	end

	def asker_params
		params.require(:asker).permit(:email, :name)
	end
end
