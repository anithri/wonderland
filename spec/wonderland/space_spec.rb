require 'rspec'
require 'wonderland/space'

describe Wonderland::Space do
  let(:contents) { [:batman, :robin] }
  subject { described_class.new }
  it { expect(subject.contents).to eq [] }

  describe 'contains?' do
    subject { described_class.new(contents: contents) }
    it { expect(subject.contains?(:batman)).to be_truthy }
    it { expect(subject.contains?(:robin)).to be_truthy }
    it { expect(subject.contains?(:batgirl)).to be_falsey }
  end

  describe '.remove_piece(obj)' do
    subject { described_class.new(contents: contents) }
    it { expect(subject.remove_piece(:batgirl)).to be_falsey }
    it { expect(subject.remove_piece(:robin)).to eq :robin }
    it { subject.remove_piece(:batman); expect(subject.contents).to eq [:robin] }
  end
end
