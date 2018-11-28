class AddAttachmentImageToTickets < ActiveRecord::Migration[5.2]
  def self.up
    change_table :tickets do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :tickets, :image
  end
end
