# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :debit do

    before :create do
      create(:credit, client: client, value: '20')
    end

    client
    value '10'
  end
end
