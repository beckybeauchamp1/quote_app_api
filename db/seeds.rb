# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Categorization.destroy_all
Quote.destroy_all
Category.destroy_all
Favorite.destroy_all

require 'json'
all_quotes = []
file = File.read('db/quotes.json')
quotes = JSON.parse(file)
quotes.each do |q|
  new_quote = Quote.create!(text: q["Quote"], author: q["Author"])
  all_quotes << new_quote
end

categories = ["Philosophy", "Art", "Life", "Science", "Religion", "Spirtual", "Funny", "Curiousity"]
categories.each do |category|
  Category.create!(title: category)
end

usr1 = User.create!(first_name: 'Becky', last_name: 'Beauchamp', email:'beckyb@example.com', password:'test12345')
usr2 = User.create!(first_name: 'Becky', last_name: 'Beauchamp',email:'beckybeau@example.com', password:'pizzajammy')


usr1.favorites.create!({quote: all_quotes[0]});
usr1.favorites.create!({quote: all_quotes[1]});
usr1.favorites.create!({quote: all_quotes[2]});
usr1.favorites.create!({quote: all_quotes[3]});
usr1.favorites.create!({quote: all_quotes[4]});
usr1.favorites.create!({quote: all_quotes[5]});
usr1.favorites.create!({quote: all_quotes[6]});
usr1.favorites.create!({quote: all_quotes[7]});
usr1.favorites.create!({quote: all_quotes[8]});

usr2.favorites.create!({quote: all_quotes[0]});
usr2.favorites.create!({quote: all_quotes[1]});
usr2.favorites.create!({quote: all_quotes[2]});
usr2.favorites.create!({quote: all_quotes[3]});
usr2.favorites.create!({quote: all_quotes[4]});
usr2.favorites.create!({quote: all_quotes[5]});
usr2.favorites.create!({quote: all_quotes[6]});
usr2.favorites.create!({quote: all_quotes[7]});
usr2.favorites.create!({quote: all_quotes[8]});
