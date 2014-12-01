require 'rspec'
require 'wonderland/grid'

describe Wonderland::Grid do
  subject { Virtus::Attribute.build(described_class).coerce(value_to_coerce) }

  shared_examples_for 'a successful coercer' do |val, expected, same_as = nil|
    if same_as
      it { is_expected.to eq same_as }
    end
  end

  it_behaves_like 'a successful coercer', nil, Wonderland::Grids::Base

  context 'given a nil' do
    let(:value_to_coerce) { nil }
    it { is_expected.to be_a Wonderland::Grids::Base }
  end

  context 'given a kind of Wonderland::Grids::Base' do
    let(:value_to_coerce) { Wonderland::Grids::Base.new }
    it { is_expected.to eq value_to_coerce }
  end

  context 'given a value of :base' do
    let(:value_to_coerce) { :base }
    it { is_expected.to be_a Wonderland::Grids::Base }
  end
end
