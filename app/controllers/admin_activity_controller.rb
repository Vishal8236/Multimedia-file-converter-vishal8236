class AdminActivityController < ApplicationController
	def index
		@users = User.where(admin:false)
	end

	def destroy
		User.delete(params[:id])
		redirect_to show_all_user_path
	end
	
	
end
