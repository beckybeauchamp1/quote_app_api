require "rails_helper"

RSpec.describe Quote, :type => :model do

  let(:category){Category.create!(title: "Life", user_id: 4)}
  let(:quote){Quote.create!(text: "Life is like riding a bike", author: "Einstein", user_id: 4, category_id: category.id)}

describe "attributes of a quote" do
  it "has the class Quote" do
    expect(quote).to be_a(Quote)
  end
  it "has a string of text" do
    expect(quote.text).to eq("Life is like riding a bike")
  end
  it "has an author" do
    expect(quote.author).to eq("Einstein")
  end
  it "has a category foregin key" do
    expect(quote.category_id).not_to be_nil
  end
  it "has a user foregin key" do
    expect(quote.user_id).not_to be_nil
  end
  it "has a date of when the quote was added" do
    expect(quote.created_at).to be_a(Time)
  end
end

describe "model methods" do
  describe "find all quotes by category" do
    it "should list all of a category's quotes" do
      expect(category.quotes).not_to be_nil
    end
  end
  describe "#find_by_author" do
    context "when I try to find a quote by author name" do
      it "can be search by author" do
        quotes = Quote.find_by_author("Einstein")
        quotes.each do |quote|
          expect(quote).to have_attributes(:author => "Einstein")
        end
      end
    end

    describe "#find_by_keyword" do
      context "when I try to find a quote by a search term" do
        it "can be search by key word" do
          quotes = Quote.find_by_keyword("bike")
            quotes.each do |quote|
              expect(quote.text).to include("bike")
            end
        end
      end
    end

  end
end

end
