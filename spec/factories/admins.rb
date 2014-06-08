# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin do
    sequence(:name) { |n| "Name-#{n}" }

    trait :with_organization do
      organization
    end
  end
end
