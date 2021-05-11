class UserimageuploadController < ApplicationController
	def index
		@all_img = current_user.user_images
	end
	
	def new
		@userimage = UserImage.new
	end
	
	def create
    @userimg = UserImage.create(user: current_user, user_img: params[:user_img])
		redirect_to root_path             
	end
	  
	def destroy
		@get_img = UserImage.find(params[:id])
		@get_img.destroy
		redirect_to userimageupload_index_path
	end
	
	def user_params
		params.permit(:user_image)
	end
	
end
