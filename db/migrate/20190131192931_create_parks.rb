class CreateParks < ActiveRecord::Migration
  def change
    create_table :parks do |t|
      t.string :username, null: false
      t.boolean :report, default: false, null: false
      t.string :name, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :zipcode, null: false
      t.integer :state_id, null: false
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
