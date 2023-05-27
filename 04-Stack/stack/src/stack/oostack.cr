module Stack
  class OOStack(T)
    def self.stack_empty_error_description : String
      "Stack is empty"
    end

    @top : Node(T) = Base(T).new

    def empty? : Bool
      size == 0
    end

    def size : Int
      @top.deep
    end

    def push(element : T) : Nil
      @top = Top(T).new(element, @top)
    end

    def pop : T
      popped = top
      @top = @top.previous
      popped
    end

    def top : T
      @top.value
    end
  end
end
