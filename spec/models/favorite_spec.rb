require "rails_helper"

RSpec.describe Favorite, :type => :model do
  let(:user){User.create(id: 4)}
  let(:favorite){Favorite.create(user_id: 4, quote_id: 4)}
  describe "attributes of a Favorite" do
    it "belongs to the class Favorite" do
      expect(favorite).to be_a(Favorite)
    end
    it "belongs to a user" do
      expect(user.favorites).not_to be_nil
    end
    it "is associated with a quote" do
      expect(favorite.quote_id).to be_a(Integer)
    end
  end

end
