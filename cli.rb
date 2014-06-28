require './rover'
require './map'

class MarsRoverCLI
  def start
    puts "Please enter the number of available rovers:"
    rover_number = gets.chomp.strip.to_i
    puts "Please enter the upper right coordinate of the plateau:"
    coordinates = gets.chomp

    @map = MarsMap.new(coordinates)

    rover_number.times do |index|
      puts "Please enter the starting location of rover ##{index + 1}:"
      @rover_starting_location = gets.chomp
      puts "Please enter how you want to move the rover:"
      @rover_movements = gets.chomp.upcase

      control_rover

      puts "Rover ##{index + 1} final location:"
      puts @rover.position_and_heading
    end
  end

  def start_automatic
    coordinates = gets.chomp

    @map = MarsMap.new(coordinates)

    while(true)
      @rover_starting_location = gets.chomp
      @rover_movements = gets.chomp.upcase

      control_rover

      puts rover.position_and_heading
    end
  end

  def control_rover
    @rover = MarsRover.new(@rover_starting_location)

    @rover_movements.each_char do |rover_movement|
      if rover_movement == "M"
        @rover.move
      else
        @rover.turn(rover_movement)
      end

      @map.check_location(@rover.position)
    end

    # Add rover to the map so the map can check for rover collisions
    @map.rovers << @rover
  end
end
