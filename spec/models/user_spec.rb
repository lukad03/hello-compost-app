require 'spec_helper'

describe User do
  it{ should belong_to(:rolable).dependent(:destroy) }

end
