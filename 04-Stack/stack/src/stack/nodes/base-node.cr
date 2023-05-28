require "./node"

module Stack
  class Base(T) < Node(T)
    def initialize(@stack : OOStack(T))
    end

    def value : T
      @stack.signal_stack_empty
    end

    def previous : Node(T)
      @stack.signal_stack_empty
    end

    def deep : Int
      0
    end
  end
end
