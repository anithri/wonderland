require 'virtus'

module Wonderland
  class Space
    include Virtus.model

    attribute :contents, Array, default: []

    def contains?(obj)
      contents.include?(obj)
    end

    def remove_piece(obj)
      return false unless contains?(obj)
      contents.delete(obj)
    end

    def add_piece(obj)
      contents << obj
    end
  end
end
