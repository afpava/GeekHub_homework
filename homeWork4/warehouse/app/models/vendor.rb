class Vendor < ApplicationRecord
  belongs_to :supplier
  validates_uniqueness_of :name
end
