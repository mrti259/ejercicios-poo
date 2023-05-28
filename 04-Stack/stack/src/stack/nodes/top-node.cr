require "./node"

module Stack
  class Top(T) < Node(T)
    def initialize(@value : T, @previous : Node(T))
    end

    def value : T
      @value
    end

    def previous : Node(T)
      @previous
    end

    def deep : Int
      @previous.deep + 1
    end
  end
end
