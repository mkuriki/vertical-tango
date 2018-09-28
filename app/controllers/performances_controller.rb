class PerformancesController < ApplicationController
  def index
    # sql = "SELECT b.date, b.time, v.name, bt.category, bs.status
    # FROM bookings b
    # JOIN venues v ON b.venue_id = v.id
    # JOIN booking_types bt ON b.booking_type_id = bt.id
    # JOIN booking_statuses bs ON b.booking_status_id = bs.id
    # WHERE upper(bs.status) = 'CONFIRMED';"

    # @performances = ActiveRecord::Base.connection.execute(sql)

    @performances = BookingStatus.find_by(status: 'Confirmed').bookings.preload(:venue, :booking_type, :booking_status).order(date: :asc)
  end
end
