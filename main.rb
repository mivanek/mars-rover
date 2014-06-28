#!/bin/ruby
require './cli.rb'

if ARGV.include?("--automatic") || ARGV.include?("-a")
  ARGV.shift
  MarsRoverCLI.new.start_automatic
else
  MarsRoverCLI.new.start
end
