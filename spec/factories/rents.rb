FactoryBot.define do
  factory :rent do
    user { nil }
    book { nil }
    start_date { "2019-02-06" }
    end_date { "2019-02-06" }
  end
end
