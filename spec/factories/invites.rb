# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invite do
    sequence(:email) { |n| "user#{n}@email.com" }
    organization

    trait :with_location do
    end

  end
end
