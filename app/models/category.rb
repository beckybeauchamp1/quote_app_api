class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :quotes, through: :categorizations
  validates :title, uniqueness: true
end
