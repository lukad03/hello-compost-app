require 'spec_helper'

describe Debit do
  it{ should belong_to :client }
  it{ should validate_presence_of :value }
end
