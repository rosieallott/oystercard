require 'journey'

describe Journey do

subject(:journey) {described_class.new(entry_station)}
let(:entry_station) { double :entry_station}

  describe 'initialization tests' do
    it 'expects not to be in journey initially' do
      expect(journey.complete?).to eq false
    end
    it 'takes entry station as argument' do
      expect(journey.instance_variable_get(:@entry_station)).to eq entry_station
    end
  end

  describe 'starting and finishing journeys' do
    it 'expects complete is true once finish a journey' do
      journey.finish
      expect(journey.complete?).to eq true
    end
  end

end
