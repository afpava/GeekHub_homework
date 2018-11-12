class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  require 'carrierwave'
  require 'carrierwave/orm/activerecord'
  mount_uploader :image, ImageUploader
end
