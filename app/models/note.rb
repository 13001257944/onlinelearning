class Note < ApplicationRecord
  belongs_to :user
  belongs_to :coursetextbook
end
