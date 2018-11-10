class Supplier < ApplicationRecord
  belongs_to :product
  has_many :vendors
end
