require 'journey'

describe Journey do

let(:entry_station) { double :entry_station}
let(:exit_station)  { double :exit_station}
subject(:journey) {described_class.new(entry_station)}


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
      journey.finish(exit_station)
      expect(journey.complete?).to eq true
    end

    it 'add hash to journeys array and had entry station key to hash when touching in' do
      expect(journey.log).to eq({entry_station => nil})
    end


    it 'exit station to hash when touching out' do
      journey.finish(exit_station)
      expect(journey.log).to eq({entry_station => exit_station})
    end
  end



end
