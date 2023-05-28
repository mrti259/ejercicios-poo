require "./oostack-decorator"

module Stack
  class OOStackLimited(T) < OOStackDecorator(T)
    def self.upto(limit : Int32) : self
      signal_invalid_limit unless limit > 0
      new(limit)
    end

    private def self.signal_invalid_limit : NoReturn
      raise Exception.new invalid_limit_error_description
    end

    def self.invalid_limit_error_description : String
      "Invalid limit: limit should be a natural number greater than 0."
    end

    def self.limit_reached_error_description : String
      "Limit reached: stack is full."
    end

    def initialize(@limit : Int32)
      @decoratee = OOStackUnlimited(T).empty
    end

    private def decoratee : OOStack(T)
      @decoratee
    end

    def full? : Bool
      size == @limit
    end

    def push(element : T) : Nil
      signal_limit_reached if full?
      super
    end

    private def signal_limit_reached : NoReturn
      raise Exception.new self.class.limit_reached_error_description
    end
  end
end
