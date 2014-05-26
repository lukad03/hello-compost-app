require 'spec_helper'

describe Organization do
  it { should have_many :locations }
  it { should have_many :users }
end
