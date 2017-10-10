class Building < ApplicationRecord
  has_many :issues

  default_scope { order(:name) }

  def to_s
    name
  end
end
