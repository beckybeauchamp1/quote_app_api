require "rails_helper"

RSpec.describe User, :type => :model do
  let(:user){User.create(id: 4, first_name: "Becky", last_name: "Beauchamp", email: "beckybeauchamp1@gmail.com")}
  describe "attributes of a user" do
    it "belongs to the class User" do
      expect(user).to be_a(User)
    end
    it "has a first name" do
      expect(user.first_name).to eq("Becky")
    end
    it "has a last name" do
      expect(user.last_name).to eq("Beauchamp")
    end
    it "has an email address" do
      expect(user.email).to eq("beckybeauchamp1@gmail.com")
    end
    it "has many quotes" do
      expect(user.quotes).not_to be_nil
    end
    it "has many quotes as favorites" do
      expect(user.favorites).not_to be_nil
    end
  end

end
