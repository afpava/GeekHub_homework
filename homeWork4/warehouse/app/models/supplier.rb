class Supplier < ApplicationRecord
  belongs_to :product
  has_many :vendors
  validates_uniqueness_of :name
end
