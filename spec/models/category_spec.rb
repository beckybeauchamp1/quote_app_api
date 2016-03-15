require "rails_helper"

RSpec.describe Category, :type => :model do
  let(:user){User.create(id: 4)}
  let(:category){Category.create!(title: "Life", user_id: 4)}
  let(:quote){Quote.create!(title: "New Quote", text: "Life is like riding a bikeeeee", author: "Einstein", user_id: 4, category_id: category.id)}
  describe "attributes of a Favorite" do
    it "belongs to the class Category" do
      expect(category).to be_a(Category)
    end
    it "has a title" do
      expect(category.title).to eq("Life")
    end
    it "has many quotes" do
      expect(category.quotes).not_to be_nil
    end
    it "belongs to a user" do
      expect(user.categories).not_to be_nil
    end
  end

end
