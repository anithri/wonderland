require 'rspec'
require 'wonderland/board'

describe Wonderland::Board do
  subject { described_class.new() }
  it { is_expected.to be_a described_class }
  it { expect(subject.spaces).to eq [] }
  it { expect(subject.grid).to be_a_kind_of Wonderland::Grids::Base }

  describe 'setup_pieces' do
    subject { described_class.new() }
    it 'should call map on spaces' do
      expect(subject.spaces).to receive(:each)
      subject.setup_pieces
    end
  end
end
