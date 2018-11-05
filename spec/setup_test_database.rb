require 'pg'

def setup_test_database
  # p "Setting up test database..."
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("DROP TABLE IF EXISTS postings, users CASCADE;")
  connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(60), email VARCHAR(60), password VARCHAR(60));")
  connection.exec("CREATE TABLE postings(id SERIAL PRIMARY KEY, post VARCHAR(140), date TIMESTAMP, user_id INTEGER REFERENCES users(id) ON DELETE CASCADE);")
end
