module VideoconverterHelper
	def deletevideofile
		f_name = "#{Rails.root}/#{session[:get_convert_fname]}"
		File.delete(f_name) if File.exist?(f_name)
	end
end
