require 'station'

describe Station do
  subject(:station) {described_class.new("Station", 1)}

  describe 'initializing a station' do
    it 'takes an argument on instantiation as the name' do
      expect(station.instance_variable_get(:@name)).to eq "Station"
    end

    it 'takes an argument on instantiation as the zone' do
      expect(station.instance_variable_get(:@zone)).to eq 1
    end

  end

end
