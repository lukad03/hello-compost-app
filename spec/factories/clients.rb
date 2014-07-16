# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :client do
    sequence(:username) { |n| "username-#{n}" }
    trait :with_scraps do
      after :create do |client|
        create_list(
          :scrap, 1,
          client_id: client
        )
      end
    end
  end
end
