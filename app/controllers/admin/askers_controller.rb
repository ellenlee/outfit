class Admin::AskersController < Admin::AdminController
	def index
		@askers = Asker.all
	end

  def bulk_update

    ids = Array(params[:ids])
    askers = ids.map{ |i| Asker.find_by_id(i) }.compact

    if params[:commit] == "create note"
      askers.each do |asker|
        asker.update(note: params[:note])
      end
    end

    if params[:commit] == "Delete"
      askers.each { |asker| asker.destroy }
    end

    redirect_to admin_askers_path, alert: "update"
  end

end
