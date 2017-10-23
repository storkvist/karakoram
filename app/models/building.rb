class Building < ApplicationRecord
  default_scope { order(:name) }
  has_many :issues
  resourcify

  def to_s
    name
  end
end
