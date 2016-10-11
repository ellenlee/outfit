class Admin::AdminsController < Admin::AdminController

	def index
		@admins = Admin.all
		@admin = Admin.new
	end

	def create
		@admin = Admin.new(admin_params)
		@admin.password = @admin.email
		@admin.name = @admin.email.split("@").first
		if @admin.save
			redirect_to admin_admins_path, notice: "新增成功"
		else
			@admins = Admin.all
			render "index", alert: "新增失敗，請再檢查"
		end
	end

	def destroy
		@admin = Admin.find(params[:id])
		@admin.destroy
		redirect_to admin_admins_path, alert: "刪除成功"
	end

	private
	def admin_params
		params.require(:admin).permit(:email)
		
	end
end
