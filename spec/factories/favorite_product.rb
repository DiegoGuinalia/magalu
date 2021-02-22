FactoryBot.define do
  factory :favorite_product do
    association :product
    association :favorite_list
  end
end
