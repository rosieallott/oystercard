require 'oystercard'

describe Oystercard do
    subject(:oystercard) {described_class.new(journey_class)}
    let(:amount) { double :amount }
    let(:station) { double :station }
    let(:station2) { double :station2 }
    let(:journey) { double :journey, finish: nil, details: nil, fare: 1}
    let(:journey_class) {double :journey_class, new: journey}


  describe 'Initializing a card' do

    it 'card has a balance of zero' do
      expect(oystercard.instance_variable_get(:@balance)).to eq Oystercard::BALANCE
    end

    it 'creates empty array of all journeys' do
      expect(oystercard.instance_variable_get(:@journeys)).to eq []
    end
  end

  describe '#top_up' do

    context 'when under limit' do
    it 'responds to top-up with one argument' do
      expect(oystercard).to respond_to(:top_up).with(1).argument
    end
    it 'can increase the balance' do
      expect{oystercard.top_up 10}.to change{oystercard.instance_variable_get(:@balance)}.by 10
    end
  end

    context 'when over limit' do
      it 'raises an error when more than £90 is added' do
        LIMIT = Oystercard::LIMIT
        oystercard.top_up(LIMIT)
        expect{ oystercard.top_up 5 }.to raise_error "Limit £#{LIMIT} exceeded"
      end
    end
  end

  context 'when travelling' do

    describe 'Checking impact on Journey (complete?) touch in and out' do
      before do
        oystercard.top_up(10)
        oystercard.touch_in(station)
      end
      it 'Inject a journey when touching in' do
        expect(oystercard.instance_variable_get(:@current_journey)).to eq journey
      end

      it 'Not in journey anymore when touch out' do
        oystercard.touch_out(station2)
        expect(oystercard.current_journey).to eq nil
      end

      it 'check a charge is made when touch out' do
        expect {oystercard.touch_out(station2)}.to change{oystercard.instance_variable_get(:@balance)}.by(-1)
      end
    end
  end

  describe 'error messages' do
    it 'raises an error when balance is less than minimum balance' do
      expect { oystercard.touch_in(station) }.to raise_error 'below minimum balance'
    end
  end

  describe "touch_out" do
    it "makes a journey if not touched in" do
      oystercard.top_up(50)
      oystercard.touch_out("bank")
      expect(@journeys).to_not be_empty
    end
  end

end
