class Supplier < ApplicationRecord
  belongs_to :product
  has_many :vendors, dependent: :destroy
  validates_uniqueness_of :name
end
