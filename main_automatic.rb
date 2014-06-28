require './cli_automatic.rb'

# This file is functionally indentical to main.rb, but requires
# cli_automatic.rb instead of cli.rb. This file should be used for any
# automated testing, if required. There's some more details in cli_automatic.rb

MarsRoverCLI.new.start
