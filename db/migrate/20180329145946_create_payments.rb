class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.integer :booking_id, null: false
      t.date  :date, null: false
      t.float :amount, null: false
      t.integer :payment_type_id, null: false
      t.string :financial_institution
      t.string :transaction_id
      t.string :transaction_status, null: false
      t.timestamps
    end
  end
end
