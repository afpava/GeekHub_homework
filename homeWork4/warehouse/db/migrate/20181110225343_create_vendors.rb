class CreateVendors < ActiveRecord::Migration[5.2]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :image
      t.integer :supplier_id

      t.timestamps
    end
  end
end
