class Ticket < ApplicationRecord
  belongs_to :passenger
  validates :name, uniqueness: { scope: :passenger,
    message: "Only one ticket for a passenger" }
end
