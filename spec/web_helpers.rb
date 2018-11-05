def sign_up_as_test_user
  visit '/'
  fill_in :name,with: 'Stan Testson'
  fill_in :email,with: 'stan@stan.com'
  fill_in :password,with: 'password123'
  click_button :Submit
end

def insert_user_into_test_database
  User.create(name: test_user[:name], email: test_user[:email], password: test_user[:password]).first
end
