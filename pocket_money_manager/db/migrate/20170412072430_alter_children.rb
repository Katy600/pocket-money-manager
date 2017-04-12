class AlterChildren < ActiveRecord::Migration[5.0]
  def up
    rename_table("children", "kids")
  end

  def down
    rename_table("kids", "children")
  end
end
