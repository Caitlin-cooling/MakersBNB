require 'posting'

describe Posting do

  before do
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("INSERT INTO users(name, email, password) VALUES('irina', 'irina@mail.com', 'xxxx')")
  end

  describe '#create' do
    it 'create a new posting' do
      expect(Posting.create('My new posting', 'Great place', 55, '1')).to be_an_instance_of(Posting)
    end
  end

  describe "#all" do
    it 'returns a list of all the postings' do
      Posting.create('My new posting', 'New Home!', 78, '1')
      post = Posting.all.first
      expect(post.description).to eq 'New Home!'
      expect(post.user_id).to eq '1'
    end
  end

  describe '#find(id)' do
    it 'retreives post from the database using the post id' do
      Posting.create('My new posting', 'New Home!', 78, '1')
      post = Posting.find('1')
      expect(post.title).to eq 'My new posting'
      expect(post.description).to eq 'New Home!'
      expect(post.price).to eq '78'
      expect(post.user_id).to eq '1'
    end
  end
end
