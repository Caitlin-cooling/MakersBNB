require 'booking'

describe Booking do
  let(:booking_info) { { posting_id: '1', owner_id: '1', user_id: '2' } }
  let(:posting_class) { double(:posting_class) }
  let(:user_class) { double(:user_class) }

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

    it 'should retrieve a list of bookings' do
      expect(Booking.submitted_bookings(booking_info[:user_id])).to be_a Array
    end

    it 'should retrieve a booking with the correct user id' do
      bookings = Booking.submitted_bookings(booking_info[:user_id])
      expect(bookings.first.user_id).to eq booking_info[:user_id]
    end
  end

  describe '.received_bookings' do
    before do
      insert_booking_into_test_database
    end

    it 'should retrieve a list of bookings' do
      expect(Booking.received_bookings(booking_info[:owner_id])).to be_a Array
    end

    it 'should retrieve a booking with the correct user id' do
      bookings = Booking.received_bookings(booking_info[:owner_id])
      expect(bookings.first.owner_id).to eq booking_info[:owner_id]
    end
  end

  describe '.retrieve_postings' do
    before do
      insert_booking_into_test_database
    end

    it 'should retrieve associated postings from a booking' do
      bookings = [Booking.new(id: '1', posting_id: '1', owner_id: '1', \
        user_id: '2', posting_class: posting_class)]
      expect(posting_class).to receive(:find_by_id).with(bookings.first.posting_id)
      Booking.retrieve_postings(bookings)
    end
  end

  describe '.retrieve_owners' do
    before do
      insert_booking_into_test_database
    end

    it 'should retrieve associated owners from a booking' do
      bookings = [Booking.new(id: '1', posting_id: '1', owner_id: '1', \
        user_id: '2', user_class: user_class)]
      expect(user_class).to receive(:find_by_id).with(bookings.first.owner_id)
      Booking.retrieve_owners(bookings)
    end
  end

  describe '.retrieve_bookers' do
    before do
      insert_booking_into_test_database
    end

    it 'should retrieve associated booking users from a booking' do
      bookings = [Booking.new(id: '1', posting_id: '1', owner_id: '1', \
        user_id: '2', user_class: user_class)]
      expect(user_class).to receive(:find_by_id).with(bookings.first.user_id)
      Booking.retrieve_bookers(bookings)
    end
  end
end
