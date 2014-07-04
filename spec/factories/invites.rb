# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invite do
    sequence(:email) { |n| "invite#{n}@email.com" }
    organization

    trait :with_location do
    end
  end
end
