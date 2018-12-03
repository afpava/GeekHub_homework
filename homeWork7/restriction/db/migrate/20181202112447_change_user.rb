class ChangeUser < ActiveRecord::Migration[5.2]
  def up
    change_column_null(:users, :email, false)
   end

    def down
    change_column_null(:users, :email, true)
    end
end
