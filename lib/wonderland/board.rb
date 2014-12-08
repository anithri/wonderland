require 'virtus'

require 'wonderland/grid'
require 'wonderland/space'

module Wonderland
  class Board
    extend Forwardable
    include Virtus.model

    attribute :spaces, Hash[Symbol => Space], default: {}
    attribute :connections, Hash
    attribute :grid, Grid, default: ->(*a) { Grid.new }
    def_delegators :@grid, :can_move?, :connect

    def initialize(*args)
      super(*args)
      init_connections if connections
    end

    def move_piece(component, from:, to:)
      return false unless from && from.include?(component)
      return false unless can_move?(from, to: to)
      from.remove_piece(component) && to.add_piece(component)
    end

    def add_space(name, space = Space.new)
      spaces[name] = space
    end

    def add_piece(piece, space)
      spaces[space].add_piece(piece)
    end

    private
    def init_connections
      connections.each_pair do |from, to_arr|
        to_arr.each { |to| connect(from, to) }
      end
    end
  end
end
