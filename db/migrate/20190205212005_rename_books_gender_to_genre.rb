class RenameBooksGenderToGenre < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :gender, :genre
  end
end
