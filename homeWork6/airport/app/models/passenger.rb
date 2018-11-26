class Passenger < ApplicationRecord
  has_many :tickets, dependent: :destroy
  belongs_to :plane
  validates :name, uniqueness: { scope: :plane,
    message: "Only one passenger for the plane" }
end
