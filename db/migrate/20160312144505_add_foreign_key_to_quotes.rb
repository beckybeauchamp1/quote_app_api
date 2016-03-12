class AddForeignKeyToQuotes < ActiveRecord::Migration
  def change
    add_reference :quotes, :category, index: true, foreign_key: true
  end
end
