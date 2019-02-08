class Book < ApplicationRecord
  validates :genre, presence: true
  validates :author, presence: true
  validates :image, presence: true
  validates :title, presence: true
  validates :year, presence: true
  validates :publisher, presence: true
  has_many :rents, dependent: :destroy
end
