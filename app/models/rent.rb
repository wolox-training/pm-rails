class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
