class Issue < ApplicationRecord
  enum status: [new: 1, accepted: 2, closed: 3]
  has_secure_token
  resourcify

  validates_presence_of :description
  validates_presence_of :hostel
  validates_presence_of :room

  belongs_to :hostel
end
