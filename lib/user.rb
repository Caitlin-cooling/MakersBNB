require_relative 'database_connection'

class User

  def self.create(name:, email:, password:)
    DatabaseConnection.query("INSERT INTO users(name,email,password) VALUES('#{name}', '#{email}', '#{password}') RETURNING id, name, email, password;")
  end
end
