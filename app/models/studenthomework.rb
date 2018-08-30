class Studenthomework < ApplicationRecord
  belongs_to :user
  belongs_to :homework

  mount_uploader :file, FileUploader
end
