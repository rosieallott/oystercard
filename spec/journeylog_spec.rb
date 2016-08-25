require "journeylog"

describe JourneyLog do

  subject(:journeylog) {described_class.new(journey_class)}
  let(:journey_class){double :journey_class, new: journey}
  let(:journey) {double :journey}

  it 'Injects a journey when journey starts' do
    expect(journeylog.instance_variable_get(:@current_journey)).to eq nil
  end

  it "instantiates new instace of current journey on call." do
    expect(journeylog.start).to eq journey
  end

end
