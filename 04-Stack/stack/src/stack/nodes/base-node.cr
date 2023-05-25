require "./node"

module Stack
  class Base(T) < Node(T)
    def value : T
      signal_empty_error
    end

    def previous : Node(T)
      signal_empty_error
    end

    def deep : Int
      0
    end

    def signal_empty_error
      raise Exception.new OOStack.stack_empty_error_description
    end
  end
end
