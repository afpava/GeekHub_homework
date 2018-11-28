class AddAttachmentImageToPassengers < ActiveRecord::Migration[5.2]
  def self.up
    change_table :passengers do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :passengers, :image
  end
end
