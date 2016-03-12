class Category < ActiveRecord::Base
  has_many :quotes
  validates :title, uniqueness: true
end
