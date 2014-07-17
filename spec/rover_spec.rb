require 'rspec'
require './rover.rb'

describe MarsRover do
  context "with valid input" do
    subject { MarsRover.new("1 2 N") }

    it 'should be able to move' do
      subject.move
      expect(subject.position).to eq([1, 3])
    end

    it 'should be able to turn left' do
      subject.turn("L")
      expect(subject.heading).to eq("W")
    end

    it 'should be able to turn right' do
      subject.turn("R")
      expect(subject.heading).to eq("E")
    end

    it 'should correctly display position and heading' do
      subject.turn("R")
      subject.move
      expect(subject.position_and_heading).to eq('2 2 E')
    end
  end

  context "with an input that contains different coordinate seperators" do
    subject { MarsRover.new("1,..2 N") }

    it 'should be able to move' do
      subject.move
      expect(subject.position).to eq([1, 3])
    end

    it 'should be able to turn left' do
      subject.turn("L")
      expect(subject.heading).to eq("W")
    end

    it 'should be able to turn right' do
      subject.turn("R")
      expect(subject.heading).to eq("E")
    end

    it 'should correctly display position and heading' do
      subject.turn("R")
      subject.move
      expect(subject.position_and_heading).to eq('2 2 E')
    end
  end

  context "with invalid input" do
    it "when there's to many characters given for the inital position" do
      expect { MarsRover.new("2, 3 5 M") }.to raise_error(InvalidInputError)
    end

    it "when the given heading is invalid" do
      expect { MarsRover.new("2 3 Q") }.to raise_error(InvalidInputError)
    end
  end
end
