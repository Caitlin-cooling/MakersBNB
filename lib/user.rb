require 'bcrypt'
require_relative 'database_connection'

class User

  attr_reader :id, :name, :email, :password

  def initialize(id:, name:, email:, password:)
    @id = id
    @name = name
    @email = email
    @password = password
  end

  def self.create(name:, email:, password:)
    DatabaseConnection.query("INSERT INTO users(name,email,password) VALUES('#{name}', '#{email}', '#{BCrypt::Password.create(password)}') RETURNING id, name, email, password;")
  end

  def self.all
    users = DatabaseConnection.query("SELECT * FROM users")
    users.map do |user|
      User.new(id: user['id'], name: user['name'], email: user['email'], password: user['password'])
    end
  end
end
