require './lib/ship'
require './lib/cell'
require './lib/board'

class Setup
  attr_reader :player
def initialize(player)
  @player = player
