require 'virtus'

require 'wonderland/grid'
require 'wonderland/space'

module Wonderland
  class Board
    include Virtus.model

    # @!attribute [rw] spaces
    #   @return [Array<Space>]
    attribute :spaces, Array[Space], default: ->(*a) { [] }

    # @!attribute [rw] grid
    #   @return [Grid]
    attribute :grid, Grid

    def setup_pieces
      spaces.each { |space| space.grid = grid }
    end
  end
end
