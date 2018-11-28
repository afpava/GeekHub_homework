class Airport < ApplicationRecord
  has_many :planes, dependent: :destroy
  belongs_to :city
  validates :name, :presence => true, uniqueness: { scope: :city,
    message: "Only one airport for a city" }

    has_attached_file :image
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
