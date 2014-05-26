require 'spec_helper'

describe FacilitatorLocation do
  it { should belong_to :location }
  it { should belong_to :facilitator }
end
