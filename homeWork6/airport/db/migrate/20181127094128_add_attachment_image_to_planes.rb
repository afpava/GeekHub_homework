class AddAttachmentImageToPlanes < ActiveRecord::Migration[5.2]
  def self.up
    change_table :planes do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :planes, :image
  end
end
