module Wonderland
  class ActiveSpace < Space
    attribute :before_arrival_callbacks, Array[Proc], default: []
    attribute :after_arrival_callbacks, Array[Proc], default: []
    attribute :before_departure_callbacks, Array[Proc], default: []
    attribute :after_departure_callbacks, Array[Proc], default: []
    attribute :before_turn_callbacks, Array[Proc], default: []
    attribute :after_turn_callbacks, Array[Proc], default: []

    def remove_piece(obj)
      before_departure_callbacks.each { |bd| bd.call(self, obj) }
      r = super(obj)
      after_departure_callbacks.each { |ad| ad.call(self, obj) }
      r
    end

    def add_piece(obj)
      before_arrival_callbacks.each { |ba| ba.call(self, obj) }
      r = super(obj)
      after_arrival_callbacks.each { |aa| aa.call(self, obj) }
      r
    end

    def take_turn(turn, &blk)
      before_turn_callbacks.each { |bt| bt.call(self, turn) }
      yield(self, turn) if block_given?
      after_turn_callbacks.each { |at| at.call(self, turn) }
    end
  end
end
