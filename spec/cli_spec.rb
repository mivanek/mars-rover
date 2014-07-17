require 'rspec'
require './spec/spec_helper'
require './cli'

describe MarsRoverCLI do
  subject { MarsRoverCLI.new }

  context "moving one rover" do
    before do
      allow(subject).to receive(:gets).and_return("1", "5 5\n", "1 2 N\n", "LMLMLMLMM\n")
    end

    it "should print the correct location" do
      output = capture_stdout { subject.start }
      expect(output).to include("1 3 N")
    end
  end

  context "moving multiple rovers" do
    before do
      allow(subject).to receive(:gets).and_return("2", "5 5\n",
                                                  "1 2 N\n", "LMLMLMLMM\n",
                                                  "3 3 E\n", "MMRMMRMRRM\n")
    end

    it "should print multiple locations" do
      output = capture_stdout { subject.start }
      expect(output).to include("1 3 N", "5 1 E")
    end
  end
end
