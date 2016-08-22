require 'oystercard'

describe Oystercard do

  it 'tests a freshly initialized card has balance of zero' do
    expect(subject.instance_variable_get(:@balance)).to eq 0
  end
end
