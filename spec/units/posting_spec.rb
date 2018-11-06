require 'posting'

describe Posting do
  describe '#create' do
    it 'create a new posting' do
      connection = PG.connect(dbname: 'makersbnb_test')
      connection.exec("INSERT INTO users(name, email, password) VALUES('irina', 'irina@mail.com', 'xxxx')")
      expect(Posting.create('My new posting', '1')).to be_an_instance_of(Posting)
    end
  end

  describe "#all" do
    it 'returns a list of all the postings' do
      connection = PG.connect(dbname: 'makersbnb_test')
      connection.exec("INSERT INTO users(name, email, password) VALUES('irina', 'irina@mail.com', 'xxxx')")
      Posting.create('New Home!', '1')
      post = Posting.all.first
      expect(post.post).to eq 'New Home!'
      expect(post.user_id).to eq '1'
    end
  end
end
