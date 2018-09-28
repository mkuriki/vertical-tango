class Payment < ApplicationRecord
  belongs_to :booking

  validates :booking_id, presence: true
  validates :amount, presence: true
  validates :date, presence: true
  validates :payment_type_id, presence: true
  validates :transaction_status, presence: true
end
