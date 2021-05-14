class VideoconverterController < ApplicationController
	include VideoconverterHelper
	def index
		
	end
	
	def create
		require 'fileutils'
		tmp = params[:my_file].tempfile
		file = File.join("public/videocoversion", params[:my_file].original_filename)
		FileUtils.cp tmp.path, file

		output_fname = file.slice(0, file.length()-4)

		path = "#{Rails.root}/public/videocoversion"
		len = Dir[File.join(path, '**', '*')].count { |file| File.file?(file) }
		len = len + 1

		#conver video file
		user_id = current_user.id
		song_in = "#{Rails.root}/public/videocoversion/#{params[:my_file].original_filename}"
		song_out = "#{Rails.root}/public/videocoversion/output#{len}.#{params[:to]}"
		system('ffmpeg', '-i', song_in, song_out)

	    # delete get file
		FileUtils.rm file

		session[:get_convert_fname] = song_out
	end
	
	def downloadfile
		send_file "#{session[:get_convert_fname]}", type: 'video/*', status: 202
	end
	
	# def deletefile
	# 	require 'fileutils'
	# 	f_name = "#{Rails.root}/#{session[:get_convert_fname]}"
	# 	FileUtils.rm f_name
	# 	# File.delete(f_name) if File.exist?(f_name)
	# 	redirect_to video_converter_path
	# end
	
	
end
