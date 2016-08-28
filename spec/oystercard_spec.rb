require 'oystercard'

describe Oystercard do
    subject(:oystercard) {described_class.new}
    let(:amount) { double :amount }
    let(:station) { double :station }
    let(:journey) { double :journey, finish: nil, start: nil, finished?: nil, fare: 1}
    let(:journey_log) {double :journey_log}


  describe 'Initializing a card' do

    it 'card has a balance of zero' do
      expect(oystercard.balance).to eq 0
    end
  end

  describe '#top_up' do

    it 'responds to top-up with one argument' do
      expect(oystercard).to respond_to(:top_up).with(1).argument
    end
    it 'can increase the balance' do
      expect{oystercard.top_up 10}.to change{oystercard.balance}.by 10
    end
    it 'raises an error when balance is less than minimum balance' do
      expect {oystercard.touch_in(station)}.to raise_error 'below minimum balance'
    end
    it 'raises an error when more than £90 is added' do
      LIMIT = Oystercard::LIMIT
      oystercard.top_up(LIMIT)
      expect{ oystercard.top_up 1 }.to raise_error "Limit £#{LIMIT} exceeded"
    end
  end

  context 'touching in, touching out' do
    before do
      oystercard.top_up(10)
    end
    # it 'takes entry station to journey log' do
    #   expect(journey_log).to receive(:start).with(station)
    #   oystercard.touch_in(station)
    # end
    # it 'takes exit station to journey log' do
    #   expect(journey_log).to receive(:finish).with(station)
    #   oystercard.touch_out(station)
    # end
    it 'check a charge is made when touch out' do
      oystercard.touch_in(station)
      expect {oystercard.touch_out(station)}.to change{oystercard.balance}.by(-1)
    end
  end

end
