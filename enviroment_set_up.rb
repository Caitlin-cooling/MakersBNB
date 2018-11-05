require './lib/database_connection.rb'

if ENV['ENVIROMENT'] == 'test'
  DatabaseConnection.setup('makersbnb_test')
else
  DatabaseConnection.setup('makersbnb')
end
