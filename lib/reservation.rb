# require_relative "spec_helper"

class Reservation
  def initialize(reservation_id: 0, start_date: nil, end_date: nil)
    @reservation_id = reservation_id
    @start_date = start_date
    @end_date = end_date
  end
end
