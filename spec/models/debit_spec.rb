require 'spec_helper'

describe Debit do
  it{ should belong_to :client }
  it{ should validate_presence_of :value }

  describe '#enough_credits' do
    it 'is invalid if there are not enough credits' do
      debit = FactoryGirl.build(:debit, value: '12')

      debit.valid?
      debit.errors[:value].should include 'Not enough credits'
    end
  end
end
