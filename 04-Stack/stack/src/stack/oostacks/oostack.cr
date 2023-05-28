require "../nodes/**"

module Stack
  abstract class OOStack(T)
    def self.stack_empty_error_description : String
      "Stack is empty"
    end

    protected def signal_stack_empty : NoReturn
      raise Exception.new self.class.stack_empty_error_description
    end

    abstract def empty? : Bool

    abstract def size : Int

    abstract def push(element : T) : Nil

    abstract def pop : T

    abstract def top : T
  end
end
