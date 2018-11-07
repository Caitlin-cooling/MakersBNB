require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

task :test_database_clean do
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("DROP TABLE IF EXISTS bookings, postings, users CASCADE;")
  connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(60), email VARCHAR(60), password VARCHAR(60));")
  connection.exec("CREATE TABLE postings(id SERIAL PRIMARY KEY, title VARCHAR(140), description VARCHAR(500), price INT, date TIMESTAMP, user_id INTEGER REFERENCES users(id) ON DELETE CASCADE, date_from DATE, date_to DATE);")
  connection.exec("CREATE TABLE bookings(id SERIAL PRIMARY KEY, posting_id INTEGER REFERENCES postings(id) ON DELETE CASCADE, owner_id INTEGER REFERENCES users(id) ON DELETE CASCADE, user_id INTEGER REFERENCES users(id) ON DELETE CASCADE);")
end

task :setup do
  ['makersbnb', 'makersbnb_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database}")
    connection = PG.connect(dbname: database)
    connection.exec('CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(60), email VARCHAR(60), password VARCHAR(60));')
    connection.exec('CREATE TABLE postings(id SERIAL PRIMARY KEY, title VARCHAR(140), description VARCHAR(500), price INT, date TIMESTAMP, user_id INTEGER REFERENCES users(id) ON DELETE CASCADE, date_from DATE, date_to DATE);')
    connection.exec('CREATE TABLE bookings(id SERIAL PRIMARY KEY, posting_id INTEGER REFERENCES postings(id) ON DELETE CASCADE, owner_id INTEGER REFERENCES users(id) ON DELETE CASCADE, user_id INTEGER REFERENCES users(id) ON DELETE CASCADE);')
  end
end
