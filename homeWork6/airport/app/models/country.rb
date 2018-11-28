class Country < ApplicationRecord
  has_many :cities, dependent: :destroy
  validates :name,  :presence => true
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
