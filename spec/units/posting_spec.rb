require 'posting'

describe Posting do
  before do
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("INSERT INTO users(name, email, password) \
    VALUES('irina', 'irina@mail.com', 'xxxx')")
  end

  describe '#create' do
    it 'create a new posting' do
      expect(Posting.create('My new posting', 'Great place', 55, '1',
                            '06/11/2018', '07/11/2018')).to be_an_instance_of(Posting)
    end
  end

  describe '#all' do
    it 'returns a list of all the postings' do
      Posting.create('My new posting', 'New Home!', 78, '1', '06/11/2018',
                     '07/11/2018')
      post = Posting.all.first
      expect(post.description).to eq 'New Home!'
      expect(post.user_id).to eq '1'
    end
  end

  describe '#find(id)' do
    it 'retreives post from the database using the post id' do
      Posting.create('My new posting', 'New Home!', 78, '1', '06/11/2018',
                     '07/11/2018')
      post = Posting.find_by_id('1')
      expect(post.title).to eq 'My new posting'
      expect(post.description).to eq 'New Home!'
      expect(post.price).to eq '78'
      expect(post.user_id).to eq '1'
    end
  end

  describe ".retreive_unavailable_dates" do

    before do
      insert_users_into_test_database
      insert_posting_into_test_database
    end

    it "retreive an unavailable date for a booking" do
      pending_booking = Booking.create(posting_id: '1', owner_id: '1',
                                       user_id: '2', booking_date: '2018-11-08')
      pending_booking.update_status('Confirmed')
      posting_id = Posting.find_by_id(pending_booking.posting_id)
      expect(Posting.retreive_unavailable_dates(posting_id)).to eq ['2018-11-08']
    end

    it "retreive unavailable dates for a booking" do
      pending_booking1 = Booking.create(posting_id: '1', owner_id: '1',
                                       user_id: '2', booking_date: '2018-11-08')
      pending_booking2 = Booking.create(posting_id: '1', owner_id: '1',
                                        user_id: '2', booking_date: '2018-11-09')
      pending_booking1.update_status('Confirmed')
      pending_booking2.update_status('Confirmed')
      posting_id = Posting.find_by_id(pending_booking1.posting_id)
      expect(Posting.retreive_unavailable_dates(posting_id)).to eq ['2018-11-08', '2018-11-09' ]
    end
  end
end
