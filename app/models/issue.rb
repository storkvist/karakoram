class Issue < ApplicationRecord
  enum status: { accepted: 1, reviewed: 2, in_work: 3, closed: 4, rejected: 5 }
  has_paper_trail
  has_secure_token
  resourcify

  validates_presence_of :description
  validates_presence_of :building
  validates_presence_of :room

  belongs_to :building
  has_many :comments
  has_many :features
  has_many :tags, through: :features
  accepts_nested_attributes_for :tags

  default_scope { order(created_at: :asc) }
end
