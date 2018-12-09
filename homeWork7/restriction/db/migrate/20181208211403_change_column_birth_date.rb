class ChangeColumnBirthDate < ActiveRecord::Migration[5.2]
  def self.up
   change_table :users do |t|
     t.change :birth_date, :date
   end
 end
 def self.down
   change_table :users do |t|
     t.change :birth_date, :string
   end
 end
end
