require "garage"

describe Garage do
    describe "#release_fixed_bikes" do

        context "when garage has no fixed bikes" do
            before { subject.instance_variable_set(:@fixed_bikes, []) }
            it "should raise an exception" do
                expect{ subject.release_fixed_bikes }.to raise_error("No Fixed bikes")
            end
        end

        context "when garage has fixed bikes" do
            let (:bike) { double :bike }
            before { subject.instance_variable_set(:@fixed_bikes, [bike, bike, bike])}
            it "should release them to van" do
                expect( subject.release_fixed_bikes).to eq [bike,bike,bike]
            end
        end
    end
end