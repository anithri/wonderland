require 'rspec'
require 'gotham_board'
describe GothamBoard do
  let(:file_name) { 'etc/gotham_board.yml' }
  subject { described_class.load_board(file_name) }

  describe '#load_board(file)' do
    it { is_expected.to be_a Wonderland::Board }
  end

  describe 'contents' do
    it { expect(subject.spaces.count).to eq 12 }
    it { expect(subject.can_move?(:tower, to: :old_gotham)).to be_falsey }
    it { expect(subject.can_move?(:tower, to: :parkside)).to be_truthy }
    it { expect(subject.grid.neighbors.keys.count).to eq 12 }
  end
end
