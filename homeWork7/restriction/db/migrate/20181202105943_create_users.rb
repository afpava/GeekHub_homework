class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :avatar
      t.string :last_name
      t.string :first_name
      t.string :birth_date
      t.string :gender
      t.string :phone_number
      t.string :country
      t.string :city
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
