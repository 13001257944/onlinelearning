class Course < ApplicationRecord
  has_many :coursetextbooks
  has_many :homeworks
  belongs_to :user
  has_many :courseregistions, dependent: :destroy
  has_many :courseregisted_users, through: :courseregistions, source: :user

  mount_uploader :photo, PhotoImageUploader  

  def is_courseregisted?(user)
    self.courseregisted_users.include?(user)
  end
  
end
