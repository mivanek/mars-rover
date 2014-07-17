class MarsRover
  attr_reader :position, :heading

  ORIENTATIONS = {
    "N" => { "L" => "W", "R" => "E" },
    "E" => { "L" => "N", "R" => "S" },
    "S" => { "L" => "E", "R" => "W" },
    "W" => { "L" => "S", "R" => "N" }
  }

  def initialize(rover_position)
    @position = get_starting_location(rover_position)
    @heading = get_heading(rover_position)
  end

  def move
    case @heading
    when "N"
      @position[1] += 1
    when "E"
      @position[0] += 1
    when "S"
      @position[1] -= 1
    when "W"
      @position[0] -= 1
    end
  end

  def turn(direction)
    @heading = ORIENTATIONS[@heading][direction]
  end

  def position_and_heading
    @position.join(' ') + " " + @heading
  end

  private

    def get_heading(rover_position)
      check_heading(rover_position.strip[-1].upcase)
    end

    def get_starting_location(rover_position)
      check_location(rover_position.split(/\D+/).map { |x| x.to_i })
    end

    def check_heading(heading)
      raise InvalidInputError, "The heading you entered was invalid, please try again." if heading.length != 1 || !ORIENTATIONS.keys.include?(heading)
      heading
    end

    def check_location(location)
      raise InvalidInputError, "The coordinates you entered were invalid, please try again." if location.length != 2
      location
    end
end

class InvalidInputError < StandardError; end
