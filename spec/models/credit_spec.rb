require 'spec_helper'

describe Credit do
  it { should belong_to :client }
end
