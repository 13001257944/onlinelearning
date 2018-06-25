class Course < ApplicationRecord
  has_many :coursetextbooks
  belongs_to :user

  mount_uploader :photo, PhotoImageUploader  
  
end
