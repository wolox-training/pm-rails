FactoryBot.define do
  factory :book_suggestion do
    user { build(:user) }
    synopsis { Faker::Book.title }
    price { Faker::Number.decimal(2, 3) }
    author { Faker::Book.author }
    title { Faker::Book.title }
    link { Faker::Placeholdit.image("600x600") }
    publisher { Faker::Book.publisher }
    year { Faker::Number.between(1890, Time.zone.now.year) }
  end
end
