# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

file = File.expand_path('CSV/venues.csv', __FILE__)
CSV.foreach(Rails.root.join(file), headers: true) do |row|
  data = {
    name: row[0],
    address: row[1],
    city: row[2],
    state: row[3],
    zip: row[4],
    country: row[5]
  }
  Venue.where(name: row[0]).first_or_create(data).update(data)
end

file = File.expand_path('CSV/clients.csv', __FILE__)
CSV.foreach(Rails.root.join(file), headers: true) do |row|
  data = {
    first_name: row[0],
    last_name: row[1],
    company: row[2],
    address: row[3],
    city: row[4],
    state: row[5],
    zip: row[6],
    country: row[7],
    email: row[8],
    phone: row[9]
  }
  Client.where(email: row[8]).first_or_create(data).update(data)
end

file = File.expand_path('CSV/booking_types.csv', __FILE__)
CSV.foreach(Rails.root.join(file), headers: true) do |row|
  data = { category: row[0] }
  BookingType.where(category: row[0]).first_or_create(data).update(data)
end

file = File.expand_path('CSV/booking_statuses.csv', __FILE__)
CSV.foreach(Rails.root.join(file), headers: true) do |row|
  data = { status: row[0] }
  BookingStatus.where(status: row[0]).first_or_create(data).update(data)
end

file = File.expand_path('CSV/bookings.csv', __FILE__)
CSV.foreach(Rails.root.join(file), headers: true) do |row|
  data = {
    client_id: row[0],
    venue_id: row[1],
    date: Date.parse(row[2]),
    time: row[3],
    duration: row[4],
    budget: row[5],
    fee: row[6],
    booking_type_id: BookingType.find(row[7]).id,
    booking_status_id: BookingStatus.find(row[8]).id
  }
  Booking.where(client_id: row[0], venue_id: row[1], date: row[2], time: row[3]).first_or_create!(data).update(data)
end

file = File.expand_path('CSV/payment_types.csv', __FILE__)
CSV.foreach(Rails.root.join(file), headers: true) do |row|
  data = { category: row[0] }
  PaymentType.where(category: row[0]).first_or_create!(data).update(data)
end

file = File.expand_path('CSV/payments.csv', __FILE__)
CSV.foreach(Rails.root.join(file), headers: true) do |row|
  data = {
    booking_id: row[0],
    date: Date.parse(row[1]),
    amount: row[2],
    payment_type_id: PaymentType.find(row[3]).id,
    financial_institution: row[4],
    transaction_id: row[5],
    transaction_status: row[6]
  }
  Payment.where(booking_id: row[0], amount: row[1], date: row[2]).first_or_create!(data).update(data)
end
