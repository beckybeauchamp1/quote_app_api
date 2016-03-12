class Quote < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  validates :title, uniqueness: true
  validates :text, uniqueness: true

  def find_by_author(author_name)

  end
end
