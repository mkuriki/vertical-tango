class AddFkToPayments < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :payments, :bookings
  end
end
