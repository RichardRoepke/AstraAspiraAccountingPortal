class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :username, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.integer :accommodations_new_cancelled, null: false
      t.decimal :total_rev, null: false
      t.decimal :total_cash, null: false
      t.decimal :deposits, null: false
      t.decimal :total_credit_card_payments, null: false
      t.decimal :transaction_fees, null: false
      t.decimal :credit_card_fees, null: false
      t.decimal :total_fees, null: false
      t.decimal :distribute_amount, null: false
      t.string :file_name, null: false
      t.string :file_url, null: false

      t.timestamps
    end
  end
end
