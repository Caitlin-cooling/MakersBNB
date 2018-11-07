class Posting

  attr_reader :id, :title, :description, :price, :date, :user_id, :date_from, :date_to

  def initialize(id:, title:, description:, price:, date:, user_id:, date_from:, date_to:)
    @id = id
    @title = title
    @description = description
    @price = price
    @date = date
    @user_id = user_id
    @date_from = date_from
    @date_to = date_to
  end

  def self.create(title, description, price, user_id, date_from, date_to)
    result = DatabaseConnection.query("INSERT INTO postings(title, description, price, date, user_id, date_from, date_to) VALUES ('#{title}', '#{description}', '#{price}', '#{Time.now}', '#{user_id}', '#{date_from}', '#{date_to}') RETURNING *;")
    Posting.new(id: result[0]['id'], title: result[0]['title'], description: result[0]['description'], price: result[0]['price'], date: result[0]['date'], user_id: result[0]['user_id'], date_from: result[0]['date_from'], date_to: result[0]['date_to'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM postings ORDER BY date DESC;")
    result.map do |post|
      Posting.new(id: post['id'], title: post['title'], description: post['description'], price: post['price'], date: post['date'], user_id: post['user_id'], date_from: post['date_from'], date_to: post['date_to'])
    end
  end

  def self.find_by_id(id)
    result = DatabaseConnection.query("SELECT * FROM postings WHERE(id = '#{id}');")
    Posting.new(id: result[0]['id'], title: result[0]['title'], description: result[0]['description'], price: result[0]['price'], date: result[0]['date'], user_id: result[0]['user_id'], date_from: result[0]['date_from'], date_to: result[0]['date_to'])
  end
end
