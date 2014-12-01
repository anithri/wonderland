require 'rspec'
require 'wonderland/space'

describe Wonderland::Space do
  subject { described_class.new() }
  it { is_expected.to be_a Wonderland::Space }
end
