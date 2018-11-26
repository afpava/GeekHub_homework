class City < ApplicationRecord
  has_many :airports, dependent: :destroy
  belongs_to :country
  validates :name, uniqueness: { scope: :country,
    message: "Only one city for a Country" }
end
