class Homework < ApplicationRecord
  belongs_to :course
  has_many :studenthomeworks


  mount_uploader :file, FileUploader
end
