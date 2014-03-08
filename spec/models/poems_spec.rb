require 'spec_helper'

describe Poem do
  it { should validate_presence_of(:body) }
  it { should validate_uniqueness_of(:body) }
end
