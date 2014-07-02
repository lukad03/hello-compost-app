require 'spec_helper'

describe Facilitator do
  it { should belong_to :organization }
  it { should have_many :facilitator_locations }
  it { should have_many(:locations).through(:facilitator_locations) }

end
