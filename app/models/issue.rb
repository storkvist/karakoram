class Issue < ApplicationRecord
  validates_presence_of :description
  validates_presence_of :hostel
  validates_presence_of :room

  belongs_to :hostel

  has_secure_token
  resourcify
end
