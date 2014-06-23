require 'spec_helper'

describe Debit do
  it{ should belong_to :client }
  it{ should validate_presence_of :value }

  describe '#enough_credits' do
    it 'is invalid if there are not enough credits' do
      debits = FactoryGirl.build(:debit)

      debits.valid?
      debits.errors[:value].should include 'Not enough credits'
    end
  end
end
