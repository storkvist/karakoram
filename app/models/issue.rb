class Issue < ApplicationRecord
  validates_presence_of :description
  validates_presence_of :hostel

  belongs_to :hostel
end
