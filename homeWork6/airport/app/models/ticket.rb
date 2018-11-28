class Ticket < ApplicationRecord
  belongs_to :passenger
  validates :name,  :presence => true, uniqueness: { scope: :passenger,
    message: "Only one ticket for a passenger" }

    has_attached_file :image
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
