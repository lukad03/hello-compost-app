require 'spec_helper'

describe Location do
  it { should belong_to :organization }
  it { should have_many :clients }
  it { should have_many :facilitator_locations }
  it { should have_many(:facilitators).through(:facilitator_locations) }
  it { should have_many :invite_locations }
  it { should have_many(:invites).through(:invite_locations) }
end
