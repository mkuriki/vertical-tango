class CreatePaymentTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :payment_types do |t|
      t.string :category
      t.timestamps
    end
  end
end
