class Admin::AskersController < Admin::AdminController
	def index
		@askers = Asker.all
	end
end
