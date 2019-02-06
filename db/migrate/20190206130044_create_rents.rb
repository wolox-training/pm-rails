class CreateRents < ActiveRecord::Migration[5.2]
  def change
    create_table :rents do |t|
      t.references :user, foreign_key: true, required: true
      t.references :book, foreign_key: true, required: true
      t.date :start_date, required: true
      t.date :end_date, required: true

      t.timestamps
    end
  end
end
