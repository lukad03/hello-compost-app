require 'spec_helper'

describe InviteLocation do
  it { should belong_to :invite}
  it { should belong_to :location}
end
