require 'rspec'
require './map'
require './rover'

describe MarsMap do

  context "with valid input" do
    subject { MarsMap.new("5, 5") }

    before { subject.rovers << MarsRover.new("1 1 N") }

    context "when checking location" do
      it "should not raise an error when the location is valid" do
        expect { subject.check_location([1, 4]) }.not_to raise_error
      end

      it "should raise an error when rovers collide" do
        expect { subject.check_location([1, 1]) }.to raise_error(RoverCollision)
      end

      it "should raise an error when your rover goes outside of map boundaries" do
        expect { subject.check_location([6, 1]) }.to raise_error(RoverOutOfBounds)
      end
    end
  end

  context "with input that contains different punctuation marks" do
    subject { MarsMap.new("5.,.. 5") }

    before { subject.rovers << MarsRover.new("1 1 N") }

    context "when checking location" do
      it "should not raise an error when the location is valid" do
        expect { subject.check_location([1, 4]) }.not_to raise_error
      end

      it "should raise an error when rovers collide" do
        expect { subject.check_location([1, 1]) }.to raise_error(RoverCollision)
      end

      it "should raise an error when your rover goes outside of map boundaries" do
        expect { subject.check_location([6, 1]) }.to raise_error(RoverOutOfBounds)
      end
    end
  end

  context "with invalid input" do
    subject { MarsMap.new("5.,.3. 5") }

    it "should raise an InvalidInputError" do
      expect { subject }.to raise_error(InvalidInputError)
    end
  end
end
