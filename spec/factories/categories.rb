FactoryBot.define do
  sequence(:category_name) { |n| "Category#{n}" }

  factory :category do
    name { generate :category_name }
    user { association :user }
  end
end
