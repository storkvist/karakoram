class Hostel < ApplicationRecord
  has_many :issues

  default_scope { order(:name) }
end
