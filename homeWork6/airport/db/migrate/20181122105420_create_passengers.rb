class CreatePassengers < ActiveRecord::Migration[5.2]
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :phone_number
      t.string :passport
      t.string :image
      t.references :plane, foreign_key: true

      t.timestamps
    end
  end
end
