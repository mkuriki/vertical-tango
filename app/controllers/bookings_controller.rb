class BookingsController < ApplicationController
  def index
    redirect_to new_booking_path
  end

  def new
    @booking = Booking.new
    @booking.build_client
    @booking.build_venue
  end

  def create
    @booking = Booking.new(b_params)

    if @booking.save
      flash[:notice] = "Booking request successfully submitted"
      redirect_to bookings_path
    else
      render :new
    end
  end

  private

  def b_params
    params.require(:booking).permit(
      :date,
      :time,
      :duration,
      :budget,
      :booking_type_id,
      :booking_status_id,
      client_attributes: [
        :first_name,
        :last_name,
        :company,
        :address,
        :city,
        :state,
        :zip,
        :country,
        :email,
        :phone ],
      venue_attributes: [
        :name,
        :address,
        :city,
        :state,
        :zip,
        :country
      ]
    )
  end
end
