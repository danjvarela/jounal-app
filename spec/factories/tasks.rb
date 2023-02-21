FactoryBot.define do
  sequence(:task_name) { |n| "Task#{n}" }

  factory :task do
    name { generate :task_name }
    description { Faker::Lorem.sentence }
    category { association :category }
  end
end
