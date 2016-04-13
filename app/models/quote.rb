class Quote < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :favorites
  has_many :users, through: :favorites
  # validates :text, uniqueness: true
  # class method, searching by author name and returns and array of every object in postgres that has that author
  def self.find_by_keyword(key_word)
    quotes = []
    Quote.find_each do |quote|
      if quote.author == key_word.capitalize
        puts "author found"
        quotes << quote
      elsif quote.author.match(/#{key_word.capitalize}/) != nil
        quotes << quote
      elsif quote.text.match(/#{key_word}/) != nil
        quotes << quote
      elsif quote.text.match(/#{key_word.capitalize}/) != nil
        quotes << quote
      end
    end
    return quotes
  end


end
