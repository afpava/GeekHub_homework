class Passenger < ApplicationRecord
  has_many :tickets, dependent: :destroy
  belongs_to :plane
  validates :name,  :presence => true, uniqueness: { scope: :plane,
    message: "Only one passenger for the plane" }

    has_attached_file :image
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
