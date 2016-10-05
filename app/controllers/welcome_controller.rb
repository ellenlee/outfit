class WelcomeController < ApplicationController
	def index
		@photo = Photo.new
		
	end
end
