class Book < ApplicationRecord
  validates :gender, presence: true
  validates :author, presence: true
  validates :image, presence: true
  validates :title, presence: true
  validates :year, presence: true
  validates :publisher, presence: true
end
