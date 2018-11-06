require 'booking'

describe Booking do
  let(:booking_info) { { posting_id: '1', owner_id: '1', user_id: '2'} }
  before do
    insert_users_into_test_database
    insert_posting_into_test_database
  end

  describe '.create' do
    it 'should create a booking object with correct info' do
      booking = Booking.create(owner_id: booking_info[:owner_id],
        posting_id: booking_info[:posting_id], user_id: booking_info[:user_id])
      expect(booking).to be_a Booking
      expect(booking.id).to eq '1'
      expect(booking.owner_id).to eq '1'
      expect(booking.posting_id).to eq '1'
      expect(booking.user_id).to eq '2'
    end
  end

  describe '.submitted_bookings' do
    before do
      insert_booking_into_test_database
    end

    it "should retrieve a list of bookings" do
      expect(Booking.submitted_bookings(booking_info[:user_id])).to be_a Array
    end
  end
end
