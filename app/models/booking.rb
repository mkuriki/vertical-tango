class Booking < ApplicationRecord
  belongs_to :client
  belongs_to :venue
  belongs_to :booking_type, optional: true
  belongs_to :booking_status
  has_many :payments

  accepts_nested_attributes_for :client, :venue

  before_validation do
    self.booking_status ||= BookingStatus.find_by!(status: 'New')
  end
end
