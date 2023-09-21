FactoryBot.define do
  factory :subscription do
    title { Faker::TvShows::StarTrek.location }
    price { 1.5 }
    status { 1 }
    frequency { "MyText" }
  end
end
