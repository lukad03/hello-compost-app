# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    sequence(:name) { |n| "Location#{n}" }
    sequence(:address) { |n| "#{n} Main Street" }
    sequence(:latitude) { |n| "1#{n}"}
    sequence(:longitude) { |n| "1#{n}" }
    organization
  end
end
