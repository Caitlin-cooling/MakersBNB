require 'booking'

describe Booking do
  describe '.create' do
    it 'should create a booking object' do
      booking = Booking.create(owner_id: '1', posting_id: '1', user_id: '2')
      expect(booking).to be_a Booking
    end
  end
end
