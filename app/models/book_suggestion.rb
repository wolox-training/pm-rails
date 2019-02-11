class BookSuggestion < ApplicationRecord
  validates :author, presence: true
  validates :title, presence: true
  validates :year, presence: true
  validates :publisher, presence: true
  validates :link, presence: true

  belongs_to :user
end
