class Issue < ApplicationRecord
  enum status: { accepted: 1, reviewed: 2, in_work: 3, closed: 4 }
  has_paper_trail
  has_secure_token
  resourcify

  validates_presence_of :description
  validates_presence_of :hostel
  validates_presence_of :room

  belongs_to :hostel

  default_scope { order(created_at: :asc) }
end
