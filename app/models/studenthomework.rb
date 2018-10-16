class Studenthomework < ApplicationRecord
  belongs_to :user
  belongs_to :homework

  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  mount_uploader :file, FileUploader

  def is_favorited?(user)
    self.favorited_users.include?(user)
  end
  
end
