# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Quote.destroy_all
Category.destroy_all

require 'json'
all_quotes = []
file = File.read('db/quotes.json')
quotes = JSON.parse(file)
quotes.each do |q|
  new_quote = Quote.create!(text: q["Quote"], author: q["Author"])
  all_quotes << new_quote
end
