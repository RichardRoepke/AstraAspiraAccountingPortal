class AddDeletedAtToPark < ActiveRecord::Migration
  def change
    add_column :parks, :deleted_at, :datetime
    add_index :parks, :deleted_at
  end
end
