FactoryBot.define do
  factory :credential do
    association :user

    description { Faker::Lorem.characters(number: 100) }
    api_key { Faker::Internet.base64 }
  end
end