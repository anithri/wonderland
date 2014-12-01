require 'virtus'
require 'facets/string/modulize'

require 'wonderland/grids/base'
require 'wonderland/grids/directed_graph'

module Wonderland
  class Grid < Virtus::Attribute
    def coerce(value)
      return value if value.kind_of? Grids::Base
      return Wonderland::Grids::Base.new if value.nil? || value.intern == :base
      return Wonderland::Grids::DirectedGraph.new if value.intern == :directed_graph
    end
  end
end
