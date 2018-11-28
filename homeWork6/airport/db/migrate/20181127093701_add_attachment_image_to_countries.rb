class AddAttachmentImageToCountries < ActiveRecord::Migration[5.2]
  def self.up
    change_table :countries do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :countries, :image
  end
end
