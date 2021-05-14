class UserOperationController < ApplicationController
	def show_doc_upload_ops
		
	end
	
	def imageconverter
		
	end
	
	def imagecompression
		
	end

	def imageuploadcompression
		# byebug
		# require 'fileutils'
		# tmp = params[:my_file].tempfile
		# file = File.join("public/imagecompression", params[:my_file].original_filename)
		# FileUtils.cp tmp.path, file
	    # YOUR PARSING JOB
		# FileUtils.rm file
		output = ImageOptimizer.new(`#{RAILS_ROOT}/public/imagecompression/abc.jpg`, quality: 25).optimize
	end
	
end
