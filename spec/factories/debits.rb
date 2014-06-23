# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :debit do
    client
    value '10'
  end
end
