require 'spec_helper'

describe Organization do
  it { should have_many :admins }
  it { should have_many :clients }
  it { should have_many :facilitators }
  it { should have_many :locations }
end
