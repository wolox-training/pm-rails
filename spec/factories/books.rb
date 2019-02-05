FactoryBot.define do
  factory :book do
    gender { Faker::Name.name }
    author { Faker::Name.name }
    image { Faker::Name.name }
    title { Faker::Name.name }
    year { Faker::Name.name }
    publisher { Faker::Name.name }
  end
end
