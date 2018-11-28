class City < ApplicationRecord
  has_many :airports, dependent: :destroy
  belongs_to :country
  validates :name, :presence => true, uniqueness: { scope: :country,
    message: "Only one city for a Country" }

    has_attached_file :image
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
