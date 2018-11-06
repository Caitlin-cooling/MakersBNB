class Booking
  attr_reader :id, :posting_id, :owner_id, :user_id

  def self.create(posting_id:, owner_id:, user_id:)
    booking = DatabaseConnection.query("INSERT INTO bookings(posting_id, " \
      "owner_id, user_id) VALUES('#{posting_id}', '#{owner_id}', " \
      "'#{user_id}') RETURNING *").first
    Booking.new(id: booking['id'], posting_id: booking['posting_id'],
      owner_id: booking['owner_id'], user_id: booking['user_id'])
  end

  def initialize(id:, posting_id:, owner_id:, user_id:)
    @id = id
    @posting_id = posting_id
    @owner_id = owner_id
    @user_id = user_id
  end
end
