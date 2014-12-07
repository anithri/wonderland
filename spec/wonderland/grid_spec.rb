require 'rspec'
require 'wonderland/grid'

describe Wonderland::Grid, focus: true do
  subject { described_class.new }
  it { is_expected.to be_a described_class }

  it { expect(subject).to have_attributes(neighbors: {}) }

  describe '.connect(from, to, reverse: true)' do
    subject do
      s = described_class.new
      s.connect(:robin, :batman)
      s.connect(:batman, :batgirl)
      s
    end

    it { expect(subject.neighbors).to eq({ robin: [:batman], batman: [:robin, :batgirl], batgirl: [:batman] }) }
    it { expect(subject.can_move_from?(:robin, to: :batman)).to be_truthy }
    it { expect(subject.can_move_from?(:batman, to: :robin)).to be_truthy }
    it { expect(subject.can_move_from?(:batman, to: :batgirl)).to be_truthy }
    it { expect(subject.can_move_from?(:batgirl, to: :batman)).to be_truthy }
    it { expect(subject.can_move_from?(:robin, to: :batgirl)).to be_falsey }

    context 'when reverse is false' do
      subject do
        s = described_class.new
        s.connect(:robin, :batman, reverse: false)
        s
      end

      it { expect(subject.neighbors).to eq({ robin: [:batman] }) }
      it { expect(subject.can_move_from?(:robin, to: :batman)).to be_truthy }
      it { expect(subject.can_move_from?(:batman, to: :robin)).to be_falsey }
    end
  end
end
