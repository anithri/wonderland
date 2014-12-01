require 'rspec'
require 'wonderland/grid'

describe Wonderland::Grid do
  subject { Virtus::Attribute.build(described_class).coerce(value_to_coerce) }

  shared_examples_for 'a successful coercer' do |val, grid_type|
    let(:value_to_coerce) { val }
    it { is_expected.to be_a grid_type }
  end

  context 'given a kind of Wonderland::Grids::Base' do
    let(:value_to_coerce) { Wonderland::Grids::Base.new }
    it { is_expected.to eq value_to_coerce }
  end

  it_behaves_like 'a successful coercer', nil, Wonderland::Grids::Base
  it_behaves_like 'a successful coercer', :base, Wonderland::Grids::Base
  it_behaves_like 'a successful coercer', :directed_graph, Wonderland::Grids::DirectedGraph
end
