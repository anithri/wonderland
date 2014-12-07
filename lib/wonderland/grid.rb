require 'virtus'
module Wonderland
  class Grid
    include Virtus.model

    attribute :neighbors, Hash, default: ->(*a) { Hash.new { |h, k| h[k] = [] } }

    def initialize(*args)
      super(*args)
      neighbors.default_proc = ->(h, k) { h[k] = [] }
    end

    def can_move_from?(from, to:)
      neighbors[from].include?(to)
    end

    def connect(from, to, reverse: true)
      neighbors[from].push(to)
      neighbors[to].push(from) if reverse
      self
    end
  end
end
