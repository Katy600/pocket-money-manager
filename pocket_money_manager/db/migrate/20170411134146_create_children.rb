class Createkids < ActiveRecord::Migration[5.0]
  def up
    create_table :kids do |t|
      t.string "name", :limit => 25
      t.string "username", :limit => 50
      t.integer "balance", :default => 0
      t.string "password_digest"
      t.timestamps
    end
    add_index("kids", "username")
  end
  def down
    drop_table :kids
  end
end
