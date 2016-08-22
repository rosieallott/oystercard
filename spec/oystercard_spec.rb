require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }

  it 'tests a freshly initialized card has balance of zero' do
    expect(oystercard.instance_variable_get(:@balance)).to eq 0
  end

  describe 'deducting fare' do
    it 'should deduct money when customer pays for journey' do
      oystercard.top_up(30)
      oystercard.deduct(20)
      expect(oystercard.instance_variable_get(:@balance)).to eq 10
    end

    it 'should have a minimum balance' do
      minimum_balance = Oystercard::MINIMUM_BALANCE
      oystercard.top_up(minimum_balance-1)
      expect { oystercard.touch_in}.to raise_error 'Minimum balance required'
    end

  end

  describe 'topping up' do
    it 'can top up card by top_up method with argument' do
      oystercard.top_up(30)
      expect(oystercard.instance_variable_get(:@balance)).to eq 30
    end

    it 'should not allow balance to exceed £90' do
      oystercard.top_up(Oystercard::MAXIMUM_BALANCE)
      msg = "Exceed maximum balance of #{Oystercard::MAXIMUM_BALANCE}"
      expect{oystercard.top_up(1)}.to raise_error msg
    end
  end

  describe 'test checking and change of in_journey status' do
    before do
      oystercard.top_up(Oystercard::MAXIMUM_BALANCE)
    end
    it 'when initialized, is not in journey' do
      expect(oystercard.in_journey?).to be false
    end
    it 'touching in changes in_journey status to true' do
      oystercard.touch_in
      expect(oystercard.in_journey?).to be true
    end
    it 'touching out (after having touched in) changes in_journey to false' do
      oystercard.touch_in
      oystercard.touch_out
      expect(oystercard.in_journey?).to be false
    end
  end



  # it 'should throw error if card with insufficient balance touched in' do
  #   msg = "Insufficient balance to touch in"
  #   expect(oystercard.touch_in).to raise_error msg
  # end

end
