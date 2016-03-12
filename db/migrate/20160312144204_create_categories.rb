class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title, null: false
      t.string :image
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
