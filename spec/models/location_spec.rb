require 'spec_helper'

describe Location do
  it { should belong_to :organization }
  it { should have_many :users}
end
