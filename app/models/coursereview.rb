class Coursereview < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :course, required: true
end
