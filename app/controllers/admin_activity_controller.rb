class AdminActivityController < ApplicationController
	before_action :remove_user_data ,only: [:destroy]

	def remove_user_data
		id = params[:id]
		byebug
		UserAudio.where(user_id: params[:id]).destroy_all
		UserImage.where(user_id: params[:id]).destroy_all
	end

	def index
		@users = User.where(admin:false)
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to show_all_user_path
	end
	
	
end
