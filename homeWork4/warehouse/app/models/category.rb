class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  belongs_to :store
  validates_uniqueness_of :name
end
