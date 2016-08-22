require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }

  it 'tests a freshly initialized card has balance of zero' do
    expect(oystercard.instance_variable_get(:@balance)).to eq 0
  end

  it 'can top up card by top_up method with argument' do
    oystercard.top_up(30)
    expect(oystercard.instance_variable_get(:@balance)).to eq 30
  end

end
