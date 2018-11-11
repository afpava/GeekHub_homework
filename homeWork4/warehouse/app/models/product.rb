class Product < ApplicationRecord
  belongs_to :category
  has_many :suppliers
  validates_uniqueness_of :name
end
