require "./oostack"

module Stack
  abstract class OOStackDecorator(T) < OOStack(T)
    private abstract def decoratee : OOStack(T)

    def empty? : Bool
      decoratee.empty?
    end

    def size : Int
      decoratee.size
    end

    def push(element : T) : Nil
      decoratee.push element
    end

    def pop : T
      decoratee.pop
    end

    def top : T
      decoratee.top
    end
  end
end
