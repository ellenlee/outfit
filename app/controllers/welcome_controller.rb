class WelcomeController < ApplicationController
	def index
		@photo = Photo.new		
	end

	def v1
		@photo = Photo.new		
	end
end
