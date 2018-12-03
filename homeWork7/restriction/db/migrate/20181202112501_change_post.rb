class ChangePost < ActiveRecord::Migration[5.2]
  def up
  change_column_null(:posts, :title, false)
    end

    def down
    change_column_null(:posts, :title, false)
    end
end
