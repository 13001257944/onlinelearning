class Courseuser < ApplicationRecord
has_many :users
belongs_to :course
end
