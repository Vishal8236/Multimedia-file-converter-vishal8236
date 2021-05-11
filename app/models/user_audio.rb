class UserAudio < ApplicationRecord
	belongs_to :user
	mount_uploader :user_audio, UserAudioUploader
end
	