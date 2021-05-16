class ImagecompressionController < ApplicationController
	def index
		
	end
	
	def create
		require 'fileutils'
		require "mini_magick"
		tmp = params[:my_file].tempfile
		file = File.join("#{Rails.root}/public/imagecompression", params[:my_file].original_filename)
		FileUtils.cp tmp.path, file

		path = "#{Rails.root}/public/imagecompression"
		len = Dir[File.join(path, '**', '*')].count { |file| File.file?(file) }
		len = len + 1

		image = MiniMagick::Image.open("#{Rails.root}/public/imagecompression/#{params[:my_file].original_filename}")
		
		#set image width and height
		size = "#{params[:img_height]}x#{params[:img_width]}"
		image.resize "#{size}"

		#store the result file in imagecompression folder
		get_extention = params[:my_file].original_filename.split(/\s|\./)

		output_fname = "#{Rails.root}/public/imagecompression/output#{len}.#{get_extention.last}"
		image.write "#{Rails.root}/public/imagecompression/output#{len}.#{get_extention.last}"

		# byebug
	    #delete get file
		FileUtils.rm file

		session[:get_compressimg_fname] = output_fname
		# sleep 5
	end

	def downloadfile
		send_file "#{session[:get_compressimg_fname]}", type: 'image/*', status: 202
		# session.delete(:get_compressimg_fname)
	end
end
