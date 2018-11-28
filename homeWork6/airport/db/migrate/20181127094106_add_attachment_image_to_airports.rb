class AddAttachmentImageToAirports < ActiveRecord::Migration[5.2]
  def self.up
    change_table :airports do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :airports, :image
  end
end
