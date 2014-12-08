require 'rspec'
require 'wonderland/board'
require 'wonderland/grid'
require 'wonderland/space'

describe Wonderland::Board do
  subject { described_class.new }
  it { expect(subject).to be_a described_class }
  it { expect(subject.spaces).to eq({}) }
  it { expect(subject.grid).to be_a Wonderland::Grid }

  describe '.can_move?(from, to:)' do
    let(:spaces) { [:nightwing, :robin] }
    subject do
      s = described_class.new(spaces: spaces)
      s.grid.connect(:robin, :nightwing)
      s.grid.connect(:nightwing, :batman)
      s
    end

    it { expect(subject.can_move?(:robin, to: :batman)).to be_falsey }
    it { expect(subject.can_move?(:robin, to: :nightwing)).to be_truthy }
    it { expect(subject.can_move?(:nightwing, to: :batman)).to be_truthy }

    context 'when passed nonexistant values' do
      subject { described_class.new }
      it { expect(subject.can_move?(:nightwing, to: :batman)).to be_falsey }
      it { expect(subject.can_move?(:batgirl, to: :nightwing)).to be_falsey }
    end
  end

  describe '.move_piece(component, from:, to:, &blk)' do
    let(:source) { Wonderland::Space.new(contents: [:batman, :robin]) }
    let(:target) { Wonderland::Space.new }
    let(:other) { Wonderland::Space.new }
    let(:spaces) { [source, target] }

    subject do
      s = described_class.new(spaces: spaces)
      s.connect source, target
      s
    end

    it 'should move piece from one space to another' do
      subject.move_piece(:batman, from: source, to: target)
      expect(source.contents).to eq [:robin]
      expect(target.contents).to eq [:batman]
    end

    context 'when passed bad values returns false' do
      it { expect(subject.move_piece(:batgirl, from: source, to: target)).to be_falsey }
      it { expect(subject.move_piece(:robin, from: other, to: target)).to be_falsey }
      it { expect(subject.move_piece(:robin, from: source, to: nil)).to be_falsey }
    end
  end
end
