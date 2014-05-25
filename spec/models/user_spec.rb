require 'spec_helper'

describe User do
  it { should have_many :scraps }
  it { should have_many :credits }
end
