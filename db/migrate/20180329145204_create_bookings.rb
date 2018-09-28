class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.integer :client_id, null: false
      t.integer :venue_id, null: false
      t.date :date
      t.time :time
      t.integer :duration
      t.integer :budget
      t.integer :fee
      t.integer :booking_type_id
      t.integer :booking_status_id, null: false
      t.timestamps
    end
  end
end
