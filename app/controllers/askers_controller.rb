class AskersController < ApplicationController

	def create
		@photo = Photo.find(params[:photo])
		@asker = Asker.find_or_initialize_by(asker_params)

		if @asker.save
			@asker.photos << @photo
			@asker.ask_count += 1
			redirect_to :root, notice: "thank your post!"
		else
			redirect_to photo_path(@photo), alert: "#{@asker.errors.full_messages.to_sentence}, #{@photo.errors.full_messages.to_sentence}"
		end
	end

	private

	def asker_params
		params.require(:asker).permit(:email, :name)
	end
end
