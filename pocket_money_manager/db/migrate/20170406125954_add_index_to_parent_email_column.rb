class AddIndexToParentEmailColumn < ActiveRecord::Migration[5.0]
  def up
    add_index("parents", "email")
  end

  def down
    remove_index("parents", "email")
  end
end
