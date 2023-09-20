FactoryBot.define do
  factory :customer do
    first_name { Faker::TvShows::Spongebob.character }
    last_name { Faker::TvShows::StarTrek.character }
    email { Faker::Internet.email }
    address { Faker::Address.full_address }
  end
end
