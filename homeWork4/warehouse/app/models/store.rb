class Store < ApplicationRecord
  has_many :categories, dependent: :destroy
  validates_uniqueness_of :name
end
