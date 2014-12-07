require 'virtus'

require 'wonderland/grid'

module Wonderland
  class Board
    include Virtus.model

    attribute :spaces, Array, default: []
    attribute :grid, Grid, default: ->(*a) { Grid.new }

    def move_piece(component, from:, to:)
      return false unless spaces.include?(to) && spaces.include?(from)
      return false unless from.contains?(component)
      from.remove_piece(component) && to.add_piece(component)
    end

    def can_move_from?(from, to: to)
      grid.can_move?(from, to: to)
    end
  end
end
