class Category < ApplicationRecord
  belongs_to :store
  has_many :products
  validates_uniqueness_of :name
end
