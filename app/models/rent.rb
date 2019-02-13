class Rent < ApplicationRecord
  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  belongs_to :user
  belongs_to :book
end
