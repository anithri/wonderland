require 'rspec'
require 'wonderland/board'

describe Wonderland::Board do
  subject { described_class.new() }
  it { is_expected.to be_a described_class }
  it { expect(subject.spaces).to eq [] }
  it { expect(subject.grid).to be_a_kind_of Wonderland::Grids::Base }

end
