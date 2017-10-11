class Tag < ApplicationRecord
  has_many :features
  has_many :issues, through: :features

  default_scope { order(:name) }
end
