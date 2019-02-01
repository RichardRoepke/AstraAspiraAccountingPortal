class AddUniquenessToPark < ActiveRecord::Migration
  def change
    add_index :parks, :username, unique: true
  end
end
