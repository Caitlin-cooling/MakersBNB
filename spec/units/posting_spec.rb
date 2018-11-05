require 'posting'

describe Posting do
  describe '#create' do
    it 'create a new posting' do
      connection = PG.connect(dbname: 'makersbnb_test')
      connection.exec("INSERT INTO users(name, email, password) VALUES('irina', 'irina@mail.com', 'xxxx')")
      expect(Posting.create('My new posting', '1')).to be_an_instance_of(Posting)
    end
  end
end
