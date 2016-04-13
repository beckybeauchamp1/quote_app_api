class Categorization < ActiveRecord::Base
  belongs_to :quote
  belongs_to :category
  validates_uniqueness_of :quote_id, :scope => :category_id
end
