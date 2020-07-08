class Profile < ApplicationRecord
  mount_uploader :foto, FotoUploader
  belongs_to :user
end
