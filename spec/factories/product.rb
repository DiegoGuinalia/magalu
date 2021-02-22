FactoryBot.define do
  factory :product do
    name { Faker::FunnyName.name }
    brand { Faker::FunnyName.name }
    image { Faker::Internet.url }
    external_id { Faker::Internet.uuid }
    title { Faker::FunnyName.name }
    price { Faker::Number.number(digits: 4) }
  end
end
