require 'journey'

describe Journey do

let(:entry_station) { double :entry_station}
let(:exit_station)  { double :exit_station}
subject(:journey) {described_class.new(entry_station)}
subject(:journey_nil) { described_class.new }

  describe 'initialization tests' do
    it 'expects not to be in journey initially' do
      expect(journey.finished?).to eq false
    end
    it 'takes entry station as argument' do
      expect(journey.entry_station).to eq entry_station
    end
  end

  describe 'starting and finishing journeys' do
    it 'expects complete is true once finish a journey' do
      journey.finish(exit_station)
      expect(journey.finished?).to eq true
    end
  end

  describe 'journey fare' do
    it 'is completed journey' do
      journey.finish(exit_station)
      expect(journey.fare).to eq described_class::MINIMUM_FARE
    end

    it 'charges penalty fare without a given exit station' do
      expect(journey.fare).to eq described_class::PENALTY_FARE
    end

    it 'charges penalty fare without a given entry station' do
      expect(journey_nil.fare).to eq described_class::PENALTY_FARE
    end

  end

end
