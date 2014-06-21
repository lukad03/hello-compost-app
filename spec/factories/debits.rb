# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :debit do

    after :build do |debit|
      create(:credit, client: debit.client, value: '11')
    end

    client
    value '10'
  end
end
