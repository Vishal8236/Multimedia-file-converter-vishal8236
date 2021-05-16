class AudioconverterController < ApplicationController
	def index
		
	end
	
	def create
		require 'fileutils'
		tmp = params[:my_file].tempfile
		file = File.join("#{Rails.root}/public/audiocoversion", params[:my_file].original_filename)
		FileUtils.cp tmp.path, file

		output_fname = file.slice(0, file.length()-4)

		path = "#{Rails.root}/public/audiocoversion"
		len = Dir[File.join(path, '**', '*')].count { |file| File.file?(file) }
		len = len + 1

		#conver video file
		user_id = current_user.id
		song_in = "#{Rails.root}/public/audiocoversion/#{params[:my_file].original_filename}"
		song_out = "#{Rails.root}/public/audiocoversion/output#{len}.#{params[:to]}"
		system('ffmpeg', '-i', song_in, song_out)

	    # delete get file
		FileUtils.rm file

		session[:get_audioconvert_fname] = song_out
	end
	
	def downloadfile
		send_file "#{session[:get_audioconvert_fname]}", type: 'audio/*', status: 202
	end
	
end
