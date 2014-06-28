require './rover'
require './map'

# This file is the same as cli.rb, but I've removed puts calls that output user
# instructions and added an infite loop. This file should be suitable for any
# autmated testing, if it's required. My test files take the output into
# consideration, so I'm using cli.rb in my tests.

class MarsRoverCLI
  def start
    coordinates = gets.chomp

    map = MarsMap.new(coordinates)

    while(true)
      rover_starting_location = gets.chomp
      rover_movements = gets.chomp.upcase

      rover = MarsRover.new(rover_starting_location)

      rover_movements.each_char do |rover_movement|
        if rover_movement == "M"
          rover.move
        else
          rover.turn(rover_movement)
        end

        map.check_location(rover.position)
      end

      # Add rover to the map so the map can check for rover collisions
      map.rovers << rover
      puts rover.position_and_heading
    end
  end
end
