class RemovePasswordFromParents < ActiveRecord::Migration[5.0]
  def up
    remove_column "parents", "password"
  end

  def down
    add_column "parents", "password", :string
  end
end
