FactoryBot.define do
  factory :product_tag do
    association :product, factory: :product
    association :tag, factory: :tag
  end
end
