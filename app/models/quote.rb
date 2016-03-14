class Quote < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  validates :title, uniqueness: true
  validates :text, uniqueness: true

  # class method, searching by author name and returns and array of every object in postgres that has that author
  def self.find_by_author(author_name)
    quotes = []
    Quote.find_each do |quote|
      if quote.author == author_name
        quotes << quote
      end
    end
    return quotes
  end

end
