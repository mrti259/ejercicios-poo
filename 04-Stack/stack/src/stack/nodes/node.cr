module Stack
  abstract class Node(T)
    abstract def value : T

    abstract def previous : Node(T)

    abstract def deep : Int

    def push(element : T) : Node(T)
      Top.new(element, self)
    end
  end
end
