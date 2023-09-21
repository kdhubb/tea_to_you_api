FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Books::Dune.quote }
    temperature { 1 }
    brew_time { 1.5 }
  end
end
