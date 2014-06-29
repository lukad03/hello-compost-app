# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    sequence(:name) { |n| "Location#{n}" }
    sequence(:address) { |n| "#{n} Main Street" }
    sequence(:latitude) { |n| "#{n}"}
    sequence(:longitude) { |n| "#{n}" }
    organization
  end
end
