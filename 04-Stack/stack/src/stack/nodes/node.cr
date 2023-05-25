module Stack
  abstract class Node(T)
    abstract def value : T
    abstract def previous : Node(T)
    abstract def deep : Int
  end
end
