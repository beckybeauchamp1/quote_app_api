class AddForeignKeyToQuotes < ActiveRecord::Migration
  def change
    add_reference :categories, :quote, index: true, foreign_key: true
  end
end
