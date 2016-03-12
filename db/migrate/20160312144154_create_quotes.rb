class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :title
      t.string :text, null: false
      t.string :author
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
