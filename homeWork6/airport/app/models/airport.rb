class Airport < ApplicationRecord
  has_many :planes, dependent: :destroy
  belongs_to :city
  validates :name, uniqueness: { scope: :city,
    message: "Only one airport for a city" }
end
