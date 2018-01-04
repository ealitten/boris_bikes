require 'bike'

describe Bike do
  it "is working" do
    # predicate syntax
    expect(subject).to be_working
    # normal syntax
    # expect(subject.working?).to eq(true)
  end
end
