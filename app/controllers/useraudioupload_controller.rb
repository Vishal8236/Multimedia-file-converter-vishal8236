class UseraudiouploadController < ApplicationController
	before_action :authenticate_user!
	def index
		@all_audio = current_user.user_audios
	end
	
	def new
		@useraudio = UserAudio.new
	end
	
	def create
		byebug
    	UserAudio.create(user: current_user, user_audio: params[:user_audio])
		redirect_to useraudioupload_index_path             
	end
	  
	def destroy
		@get_audio = UserAudio.find(params[:id])
		@get_audio.destroy
		redirect_to useraudioupload_index_path
	end

	def download_store_audio
		send_file "#{Rails.root}/public#{params[:audio_url]}"
	end
	
	def user_params
		params.permit(:user_audio)
	end
	
end
