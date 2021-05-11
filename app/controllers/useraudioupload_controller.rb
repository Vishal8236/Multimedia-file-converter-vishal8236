class UseraudiouploadController < ApplicationController
	def index
		@all_audio = current_user.user_audios
	end
	
	def new
		@useraudio = UserAudio.new
	end
	
	def create
    	UserAudio.create(user: current_user, user_audio: params[:user_audio])
		redirect_to root_path             
	end
	  
	def destroy
		@get_audio = UserAudio.find(params[:id])
		@get_audio.destroy
		redirect_to useraudioupload_index_path
	end
	
	def user_params
		params.permit(:user_audio)
	end
	
end
