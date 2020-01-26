FactoryBot.define do
  factory :product do
    name { "Test Product" }
    description { "My test product description!" }
    association :country, factory: :country
    price { "16.90" }
  end
end
