class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :image
      t.integer :product_id

      t.timestamps
    end
  end
end
