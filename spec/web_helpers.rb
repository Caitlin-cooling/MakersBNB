require_relative '../lib/database_connection'

def sign_up_as_test_user
  visit '/'
  fill_in :name,with: 'Stan Testson'
  fill_in :email,with: 'stan@stan.com'
  fill_in :password,with: 'password123'
  click_button :Submit
end

def insert_users_into_test_database
  User.create(name: 'Stan Testson', email: 'stan@stan.com', password: 'password123')
  User.create(name: 'Alice Bobson', email: 'albobson@gmail.com', password: 'password321')
end

def insert_posting_into_test_database
  Posting.create('My first posting', 'Description', '100' '1')
end

def insert_booking_into_test_database
  insert_users_into_test_database
  insert_posting_into_test_database
  DatabaseConnection.query("INSERT INTO bookings(posting_id,owner_id,user_id) VALUES('1','1','2');")
end
