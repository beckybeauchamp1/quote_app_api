class Quote < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  validates :text, uniqueness: true

  # class method, searching by author name and returns and array of every object in postgres that has that author
  def self.find_by_author(author_name)
    quotes = []
    Quote.find_each do |quote|
      if quote.author == author_name
        quotes << quote
      elsif quote.author.match(/#{author_name}/) != nil
        quotes << quote
      end
    end
    return quotes
  end

  #class method, searching by keyword and returns array of matching string
  def self.find_by_keyword(key_word)
    quotes = []
    Quote.find_each do |quote|
      if quote.text.match(/#{key_word}/) != nil
        quotes << quote
        puts quote
      end
    end
    return quotes
  end

end
