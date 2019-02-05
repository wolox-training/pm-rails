FactoryBot.define do
  factory :book do
    genre { Faker::Book.genre }
    author { Faker::Book.author }
    image { Faker::Placeholdit.image("600x600") }
    title { Faker::Book.title }
    year { Faker::Number.between(1890, Time.zone.now.year) }
    publisher { Faker::Book.publisher }
  end
end
