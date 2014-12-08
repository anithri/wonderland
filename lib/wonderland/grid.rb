require 'virtus'
module Wonderland
  # This is a simple board that allows 1 or 2 way movement between spaces
  # and assumes each move command will consist of a 1 space move.  movement points
  # expanded grids, hex and square grids, 3d space should be implemented
  # separately
  class Grid
    include Virtus.model

    attribute :neighbors, Hash, default: ->(*a) { Hash.new { |h, k| h[k] = [] } }

    def initialize(*args)
      super(*args)
      neighbors.default_proc = ->(h, k) { h[k] = [] }
    end

    def can_move?(from, to:)
      neighbors[from].include?(to)
    end

    def connect(from, to, reverse: true)
      neighbors[from].push(to)
      neighbors[to].push(from) if reverse
      self
    end
  end
end
