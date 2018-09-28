class AddFkToBookings < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :bookings, :clients
    add_foreign_key :bookings, :venues
  end
end
