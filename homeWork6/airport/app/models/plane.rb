class Plane < ApplicationRecord
  has_many :passengers, dependent: :destroy
  belongs_to :airport
  validates :name, uniqueness: { scope: :airport,
    message: "Only one plane for an airport" }
end
