require_relative 'database_connection'

class Booking
  attr_reader :id, :posting_id, :owner_id, :user_id, :posting_class, :user_class

  def self.create(posting_id:, owner_id:, user_id:)
    booking = DatabaseConnection.query('INSERT INTO bookings(posting_id, ' \
      "owner_id, user_id) VALUES('#{posting_id}', '#{owner_id}', " \
      "'#{user_id}') RETURNING *").first
    create_instance(booking)
  end

  def self.submitted_bookings(current_user_id)
    bookings = DatabaseConnection.query("SELECT * FROM bookings \
      WHERE user_id = '#{current_user_id}'")
    bookings.map do |booking|
      create_instance(booking)
    end
  end

  def self.received_bookings(current_user_id)
    bookings = DatabaseConnection.query("SELECT * FROM bookings \
      WHERE owner_id = '#{current_user_id}'")
    bookings.map do |booking|
      create_instance(booking)
    end
  end

  def self.create_instance(booking)
    Booking.new(id: booking['id'], posting_id: booking['posting_id'],
                owner_id: booking['owner_id'], user_id: booking['user_id'])
  end

  def self.retrieve_postings(bookings)
    bookings.map do |booking|
      booking.posting_class.find_by_id(booking.posting_id)
    end
  end

  def self.retrieve_owners(bookings)
    bookings.map do |booking|
      booking.user_class.find_by_id(booking.owner_id)
    end
  end

  def initialize(id:, posting_id:, owner_id:, user_id:, posting_class: Posting, user_class: User)
    @id = id
    @posting_id = posting_id
    @owner_id = owner_id
    @user_id = user_id
    @posting_class = posting_class
    @user_class = user_class
  end

  private_class_method :create_instance
end
