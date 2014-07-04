# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :facilitator do

    sequence(:name) { |n| "Name #{n}" }
    user
  end
end
