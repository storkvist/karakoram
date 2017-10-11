class Feature < ApplicationRecord
  belongs_to :issue
  belongs_to :tag
end
