class UserImage < ApplicationRecord
	belongs_to :user
	mount_uploader :user_img, UserImageUploader
end
