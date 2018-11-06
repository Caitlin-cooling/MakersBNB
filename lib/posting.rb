class Posting

  attr_reader :id, :post, :date, :user_id

  def initialize(id:, post:, date:, user_id:)
    @id = id
    @post = post
    @date = date
    @user_id = user_id
  end

  def self.create(post, user_id)
    result = DatabaseConnection.query("INSERT INTO postings(post, date, user_id) VALUES ('#{post}', '#{Time.now}', '#{user_id}') RETURNING *;")
    Posting.new(id: result[0]['id'], post: result[0]['post'], date: result[0]['date'], user_id: result[0]['user_id'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM postings;")
    result.map do |post|
      Posting.new(id: result[0]['id'], post: result[0]['post'], date: result[0]['date'], user_id: result[0]['user_id'])
    end
  end
end
