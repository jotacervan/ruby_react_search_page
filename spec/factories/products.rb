FactoryBot.define do
  factory :product do
    name { "MyString" }
    description { "MyText" }
    country { nil }
    price { "" }
  end
end
