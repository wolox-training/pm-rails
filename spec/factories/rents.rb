FactoryBot.define do
  factory :rent do
    user { create(:user) }
    book { create(:book) }
    start_date { Time.zone.today }
    end_date { start_date + Faker::Number.between(1, 20).days }
  end
end
