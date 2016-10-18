class WelcomeController < ApplicationController
	def index
		@photo = Photo.new
    @asker = Asker.new
	end

	def thanks
    @asker = Asker.find(params[:asker])

	end

	def v1
		@photo = Photo.new
	end
end
