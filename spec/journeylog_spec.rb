require "journeylog"

describe JourneyLog do

  subject(:journeylog) {described_class.new(journey_class)}
  let(:journey_class){double :journey_class, new: journey}
  let(:journey) {double :journey, entry_station: nil, finish: {:entry=> station , :exit=> station}, finished?: nil}
  let(:station) {double :station}

  describe '#start' do
    it "start a new journey" do
      expect(journeylog.start(station)).to include journey
    end
    it 'instantiates the journey with the entry station' do
      expect(journey_class).to receive(:new).with(station)
      journeylog.start(station)
    end
    it 'Inject a journey when touching in' do
      journeylog.start(station)
      expect(journeylog.journeys).to include journey
    end
  end

  describe '#finish should add exit station to current_journey' do
    it 'if journey started' do
      journeylog.start(station)
      expect(journey).to receive(:finish).with(station)
      journeylog.finish(station)
    end
    it 'if journey not started' do
      expect(journey).to receive(:finish).with(station)
      journeylog.finish(station)
    end
    it 'should add exit station to current journey' do
      expect(journeylog.finish(station)).to eq({entry: station, exit: station})
    end
  end

  # it 'should have a nil current journey once finished' do
  #   expect(journeylog.finish(station)).to eq nil
  # end

end
