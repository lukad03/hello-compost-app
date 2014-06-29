require 'spec_helper'

describe Invite do
  it { should belong_to :organization}
  it { should have_many(:locations).through(:invite_locations)}

  it { should validate_presence_of(:email) }
end
