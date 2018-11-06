require 'user'

describe User do

  let(:test_user) {{name: 'Stan Testson', email: 'stan2@testson.com', password: 'password123'}}

  before do
    insert_users_into_test_database
  end

  describe '.create' do
    it 'inserts the user into the database' do
      user = User.create(name: test_user[:name], email: test_user[:email], password: test_user[:password]).first
      expect(user['name']).to eq test_user[:name]
      expect(user['email']).to eq test_user[:email]
      expect(user['password']).to eq BCrypt::Password.new(user['password'])
      expect(user['id']).to eq '3'
    end

    it 'returns nil if email already exists in database' do
      expect(User.create(name: test_user[:name], email: 'stan@stan.com', password: test_user[:password])).to eq nil
    end
  end

  describe '.all' do
    it 'creates User object' do
      user = User.all.first
      expect(user.id).to eq '1'
      expect(user.name).to eq test_user[:name]
      expect(user.email).to eq 'stan@stan.com'
      expect(user.password).to eq BCrypt::Password.new(user.password)
    end
  end

  describe '.authenticate' do
    it 'authenticates a user log in' do
      user = User.authenticate("stan@stan.com", "password123")
      expect(user.id).to eq '1'
      expect(user.email).to eq 'stan@stan.com'
      expect(user.password).to eq BCrypt::Password.new(user.password)
      expect(user.name).to eq 'Stan Testson'
    end

    it 'returns nil if user email doesnt exist' do
      user = User.authenticate("stan@test.com", "password123")
      expect(user).to eq nil
    end

    it 'returns nil if password is incorrect' do
      user = User.authenticate("stan@stan.com", "test123")
      expect(user).to eq nil
    end
  end

  describe '.find' do
    it 'finds a user with their email' do
      user = User.find_by_email('stan@stan.com')
      expect(user.id).to eq '1'
      expect(user.email).to eq 'stan@stan.com'
      expect(user.password).to eq BCrypt::Password.new(user.password)
      expect(user.name).to eq 'Stan Testson'
    end

    it 'does not find a user with incorrect email' do
      expect(User.find_by_email('test@test.com')).to eq nil
    end
  end

  describe '.find_by_id' do
    it 'finds the user when given an in' do
      user = User.find_by_id('1')
      expect(user.email).to eq 'stan@stan.com'
    end
  end
end
