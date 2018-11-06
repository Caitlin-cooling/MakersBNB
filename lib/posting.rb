class Posting

  attr_reader :id, :title, :description, :price, :date, :user_id

  def initialize(id:, title:, description:, price:, date:, user_id:)
    @id = id
    @title = title
    @description = description
    @price = price
    @date = date
    @user_id = user_id
  end

  def self.create(title, description, price, user_id)
    result = DatabaseConnection.query("INSERT INTO postings(title, description, price, date, user_id) VALUES ('#{title}', '#{description}', '#{price}', '#{Time.now}', '#{user_id}') RETURNING *;")
    Posting.new(id: result[0]['id'], title: result[0]['title'], description: result[0]['description'], price: result[0]['price'], date: result[0]['date'], user_id: result[0]['user_id'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM postings ORDER BY date DESC;")
    result.map do |post|
      Posting.new(id: post['id'], title: post['title'], description: post['description'], price: post['price'], date: post['date'], user_id: post['user_id'])
    end
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM postings WHERE(id = '#{id}');")
    Posting.new(id: result[0]['id'], title: result[0]['title'], description: result[0]['description'], price: result[0]['price'], date: result[0]['date'], user_id: result[0]['user_id'])
  end
end
