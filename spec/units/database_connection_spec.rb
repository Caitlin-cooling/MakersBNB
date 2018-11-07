require 'database_connection'

describe DatabaseConnection do
  describe '#setup' do
    it 'sets up a database connection' do
      expect(PG).to receive(:connect).with(dbname: 'makersbnb_test')
      DatabaseConnection.setup('makersbnb_test')
    end
  end

  describe '#connection' do
    it 'returns the database connection' do
      connection = DatabaseConnection.setup('makersbnb_test')
      expect(DatabaseConnection.connection).to eq(connection)
    end
  end

  describe '#query' do
    it 'can query the database' do
      connection = DatabaseConnection.setup('makersbnb_test')
      expect(connection).to receive(:exec).with('SELECT * FROM users')
      DatabaseConnection.query('SELECT * FROM users')
    end
  end
end
