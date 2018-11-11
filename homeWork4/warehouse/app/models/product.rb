class Product < ApplicationRecord
  belongs_to :category
  has_many :suppliers, dependent: :destroy
  validates_uniqueness_of :name
end
