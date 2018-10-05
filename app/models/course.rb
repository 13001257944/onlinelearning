class Course < ApplicationRecord
  has_many :coursetextbooks, dependent: :destroy
  has_many :homeworks, dependent: :destroy
  belongs_to :user
  has_many :courseregistions, dependent: :destroy
  has_many :courseregisted_users, through: :courseregistions, source: :user

  mount_uploader :photo, PhotoImageUploader  

  def is_courseregisted?(user)
    self.courseregisted_users.include?(user)
  end

  
  
end
