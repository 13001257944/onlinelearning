class Coursetextbook < ApplicationRecord
  belongs_to :course
  has_many :comments
  has_many :finishcoursetextbooks, dependent: :destroy
  has_many :finished_users, through: :finishcoursetextbooks, source: :user

  def is_finished?(user)
    self.finished_users.include?(user)
  end

end
