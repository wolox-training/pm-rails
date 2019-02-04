class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :gender, required: true
      t.string :author, required: true
      t.string :image, required: true
      t.string :title, required: true
      t.string :year, required: true
      t.string :publisher, required: true

      t.timestamps
    end
  end
end
