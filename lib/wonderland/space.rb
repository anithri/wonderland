require 'virtus'

module Wonderland
  class Space
    extend Forwardable
    include Virtus.model

    attribute :contents, Array, default: []

    def_delegators :@contents, :include?, :delete, :<<, :push

    def remove_piece(obj)
      delete(obj)
    end

    def add_piece(obj)
      contents.push obj
    end


  end
end
