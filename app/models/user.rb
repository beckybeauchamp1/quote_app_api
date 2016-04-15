class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_many :favorites
  has_many :quotes
  has_many :categories
  has_many :favorites, inverse_of: :user
  has_many :favorited_quotes, through: :favorites, source: :quote, class_name: "Quote"
end
