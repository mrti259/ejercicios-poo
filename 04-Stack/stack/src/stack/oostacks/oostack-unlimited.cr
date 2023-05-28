require "./oostack"

module Stack
  class OOStackUnlimited(T) < OOStack(T)
    def self.empty : self
      new
    end

    @top_node : Node(T)?

    def initialize
      @top_node = Base(T).new(self)
    end

    private def top_node : Node(T)
      @top_node.not_nil!
    end

    def empty? : Bool
      size == 0
    end

    def size : Int
      top_node.deep
    end

    def push(element : T) : Nil
      @top_node = top_node.push element
    end

    def pop : T
      popped = top
      @top_node = top_node.previous
      popped
    end

    def top : T
      top_node.value
    end
  end
end
