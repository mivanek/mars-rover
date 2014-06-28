class MarsMap
  attr_accessor :rovers

  def initialize(coordinates)
    @x_max, @y_max = check_coordinates(coordinates.split(/\W+/).map { |c| c.to_i })
    @rovers = []
  end

  def check_location(current_rover_position)
    raise RoverOutOfBounds, "Your rover has exited the maps' bounds." unless valid_location? current_rover_position
    raise RoverCollision, "Your rover collided with another rover." unless empty_location? current_rover_position
  end

  private

    def valid_location?(current_rover_position)
      x, y = current_rover_position
      if x > @x_max || y > @y_max || x < 0 || y < 0
        return false
      end
      true
    end

    def empty_location?(current_rover_position)
      @rovers.each do |rover|
        if current_rover_position ==  rover.position
          return false
        end
      end
      true
    end

    def check_coordinates(coordinates)
      if coordinates.length != 2
        raise InvalidInputError
      end
      coordinates
    end
end

class RoverOutOfBounds < StandardError; end;
class RoverCollision < StandardError; end;
class InvalidInputError < StandardError; end
