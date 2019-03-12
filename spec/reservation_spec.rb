require_relative "spec_helper"
require "date"

describe "Reservation class" do
  let (:reservation) do
    Reservation.new
  end

  describe "initialize" do
    it "Creates an instance of reservation" do
      expect(reservation).must_be_instance_of Reservation
    end
    it "Reservation class initialized with nil start  date if no date is given" do
      expect(reservation.start_date).must_equal nil
    end
    it "Reservation class initialized with nil  end date if no date is given" do
      expect(reservation.end_date).must_equal nil
    end
    it "Reservation id initialized as 0 if no reservation id is entered" do
      expect(reservation.reservation_id).must_equal 0
    end
  end
  describe "duration_length method" do
    it "Duration returns the length of time between 2 dates" do
      reservation = Reservation.new(start_date: "1st Mar 2019", end_date: "8th Mar 2019")
      expect(reservation.duration).must_equal 7
    end
    it "Raises an ArgumentError if the duration is less than 1 day" do
      reservation = Reservation.new(start_date: "7th Mar 2019", end_date: "6th Mar 2019")
      expect { reservation.duration }.must_raise ArgumentError
    end
    # add this argument one I add code to duration method to raise arg error if date is in past
    # it "Raises an ArgumentError if the start date is in the past" do
    #   reservation = Reservation.new(start_date: "7th Feb 2019", end_date: "8th Feb 2019")
    #   expect { reservation.duration }.must_raise ArgumentError
    # end

    it "Can calulate duration that spans multiple months" do
      reservation = Reservation.new(start_date: "28th Feb 2019", end_date: "7th Mar 2019")
      expect(reservation.duration).must_equal 7
    end
  end
  describe "reservation_dates method" do
    it "creates an array of arrays of the dates included in a reservation" do
      reservation = Reservation.new(start_date: "1st Mar 2019", end_date: "3rd Mar 2019")
      expect(reservation.reservation_dates.first.include?(Date.parse("2nd Mar 2019"))).must_equal true
    end
  end

  describe "total_cost method" do
    it "Can calcute cost of stay" do
      reservation = Reservation.new(start_date: "1st Mar 2019", end_date: "8th Mar 2019")
      expect(reservation.total_cost).must_equal 1400
    end
  end
  describe "assign_room method" do
    it "assigns a room from @rooms array" do
      room = reservation.assign_room
      expect(reservation.rooms.include?(room)).must_equal true
    end
  end
end
