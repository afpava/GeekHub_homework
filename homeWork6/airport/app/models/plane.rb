class Plane < ApplicationRecord
  has_many :passengers, dependent: :destroy
  belongs_to :airport
  validates :name, :presence => true, uniqueness: { scope: :airport,
    message: "Only one plane for an airport" }

    has_attached_file :image, :styles => { :original => "640x640>", :mini => "260x180#", :normal => "800x400#" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
