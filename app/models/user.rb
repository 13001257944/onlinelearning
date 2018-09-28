class User < ApplicationRecord
  has_many :courseregisted_courses, through: :courseregistions, source: :course
  has_many :courseregistions, dependent: :destroy
  has_many :courseusers
  has_many :comments
  has_many :finishcoursetextbooks, dependent: :destroy
  has_many :finished_coursetextbooks, through: :finishcoursetextbooks, source: :coursetextbook
  has_many :studenthomeworks
  has_many :courses, :through => :courseregistions
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  

  def admin?
    self.role == "admin"
  end

  
 
end
