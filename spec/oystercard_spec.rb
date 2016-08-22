require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }
  let(:station){ double :station }

  it 'tests a freshly initialized card has balance of zero' do
    expect(oystercard.instance_variable_get(:@balance)).to eq 0
  end

  describe 'deducting fare' do

    it 'should have a minimum balance to touch_in' do
      minimum_balance = Oystercard::MINIMUM_BALANCE
      oystercard.top_up(minimum_balance-1)
      expect { oystercard.touch_in(station)}.to raise_error 'Minimum balance required'
    end

    it 'should allow touch_out to deduct fare' do
      oystercard.top_up(10)
      expect{oystercard.touch_out(1)}.to change{oystercard.instance_variable_get(:@balance)}.by -1
    end

  end

  describe 'topping up' do

    it 'should not allow balance to exceed £90' do
      oystercard.top_up(Oystercard::MAXIMUM_BALANCE)
      msg = "Exceed maximum balance of #{Oystercard::MAXIMUM_BALANCE}"
      expect{oystercard.top_up(rand)}.to raise_error msg
    end
  end

  it 'when initialized, is not in journey' do
    expect(oystercard.in_journey?).to be false
  end

  describe 'test checking and change of in_journey status' do
    before do
      oystercard.top_up(Oystercard::MAXIMUM_BALANCE)
      oystercard.touch_in(station)
    end

    it 'touching in changes in_journey status to true' do
      expect(oystercard.in_journey?).to be true
    end
    it 'touching out (after having touched in) changes in_journey to false' do
      oystercard.touch_out(rand)
      expect(oystercard.in_journey?).to be false
    end
    it 'expects card to remember entry station' do
      expect(oystercard.entry_station).to eq station
    end
    it 'expects the card to forget entry station after touch out' do
      oystercard.touch_out(rand)
      expect(oystercard.entry_station).to eq nil
    end
  end


end
