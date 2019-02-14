class CreateBookSuggestions < ActiveRecord::Migration[5.2]
  def change
    create_table :book_suggestions do |t|
      t.references :user, foreign_key: true
      t.string :synopsis
      t.float :price
      t.string :author
      t.string :title
      t.string :link
      t.string :publisher
      t.string :year

      t.timestamps
    end
  end
end
