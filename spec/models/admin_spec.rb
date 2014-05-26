require 'spec_helper'

describe Admin do
  it { should belong_to :organization }
  it { should have_one :user }
  it { should accept_nested_attributes_for :organization }
  it { should accept_nested_attributes_for :user }
end
