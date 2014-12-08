require 'rspec'
require 'wonderland/active_space'

describe Wonderland::ActiveSpace do
  subject { described_class.new }
  it { expect(subject.after_arrival_callbacks).to eq [] }
  it { expect(subject.before_arrival_callbacks).to eq [] }
  it { expect(subject.after_departure_callbacks).to eq [] }
  it { expect(subject.before_departure_callbacks).to eq [] }
  it { expect(subject.after_turn_callbacks).to eq [] }
  it { expect(subject.before_turn_callbacks).to eq [] }

  describe 'callbacks' do
    let(:canary) { double('canary') }
    let(:parakeet) { double('parakeet') }
    context 'arrival' do
      context 'before' do
        subject { described_class.new before_arrival_callbacks: [canary] }
        it 'calls callback' do
          expect(canary).to receive(:call).with(subject, :robin)
          subject.add_piece(:robin)
        end
      end
      context 'after' do
        subject { described_class.new after_arrival_callbacks: [parakeet] }
        it 'calls callback' do
          expect(parakeet).to receive(:call).with(subject, :robin)
          subject.add_piece(:robin)
        end
      end
      context 'around' do
        subject do
          described_class.new before_arrival_callbacks: [canary],
                              after_arrival_callbacks:  [parakeet]
        end
        it 'calls callback' do
          expect(canary).to receive(:call).with(subject, :robin)
          expect(parakeet).to receive(:call).with(subject, :robin)
          subject.add_piece(:robin)
        end
      end
    end

    context 'departure' do
      context 'before' do
        subject { described_class.new before_departure_callbacks: [canary] }
        it 'calls callback' do
          expect(canary).to receive(:call).with(subject, :robin)
          subject.remove_piece(:robin)
        end
      end
      context 'after' do
        subject { described_class.new after_departure_callbacks: [parakeet] }
        it 'calls callback' do
          expect(parakeet).to receive(:call).with(subject, :robin)
          subject.remove_piece(:robin)
        end
      end
      context 'around' do
        subject do
          described_class.new before_departure_callbacks: [canary],
                              after_departure_callbacks:  [parakeet]
        end
        it 'calls callback' do
          expect(canary).to receive(:call).with(subject, :robin)
          expect(parakeet).to receive(:call).with(subject, :robin)
          subject.remove_piece(:robin)
        end
      end
    end

    context 'take_turn' do
      context 'before' do
        subject { described_class.new before_turn_callbacks: [canary] }
        it 'calls callback' do
          expect(canary).to receive(:call).with(subject, :robin)
          subject.take_turn(:robin)
        end
      end
      context 'after' do
        subject { described_class.new after_turn_callbacks: [parakeet] }
        it 'calls callback' do
          expect(parakeet).to receive(:call).with(subject, :robin)
          subject.take_turn(:robin)
        end
      end
      context 'around' do
        subject do
          described_class.new before_turn_callbacks: [canary],
                              after_turn_callbacks:  [parakeet]
        end
        it 'calls callback' do
          expect(canary).to receive(:call).with(subject, :robin)
          expect(parakeet).to receive(:call).with(subject, :robin)
          subject.take_turn(:robin)
        end
      end
      context 'yield' do
        subject { described_class.new }
        it 'calls callback' do
          expect(canary).to receive(:call).with(subject, :robin)

          subject.take_turn(:robin) { |space, turn| canary.call(space, turn) }
        end
      end
    end
  end
end
