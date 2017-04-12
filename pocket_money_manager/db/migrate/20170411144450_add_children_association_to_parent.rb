class AddChildrenAssociationToParent < ActiveRecord::Migration[5.0]
  def change
    add_reference :children, :parent, index: true, foreign_key: true
  end
end
