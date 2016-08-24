require 'journey'

describe Journey do

subject(:journey) {described_class.new}

  describe 'initialization tests' do
    it 'expects not to be in journey initially' do
      expect(journey.complete?).to eq false
    end
  end

  describe 'starting and finishing journeys' do
    it 'expects complete is true once finish a journey' do
      journey.finish
      expect(journey.complete?).to eq true
    end
  end

end
