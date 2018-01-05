require 'bike'

describe Bike do
  it "is working" do
    expect(subject).to be_working
  end
  it 'can be reported broken' do
    subject.report_broken
    expect(subject.working?).to eq(false)
  end
end
