class AddPasswordDigestTooParents < ActiveRecord::Migration[5.0]
  def up
    add_column "parents", "password_digest", :string
  end

  def down
    remove_column "parents", "password_digest"
  end
end
