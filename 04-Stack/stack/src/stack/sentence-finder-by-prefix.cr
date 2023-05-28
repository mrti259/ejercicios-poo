module Stack
  class SentenceFinderByPrefix
    def self.invalid_prefix_error_description : String
      "Prefix can't be empty"
    end

    private def self.invalid_prefix_signal : NoReturn
      raise Exception.new invalid_prefix_error_description
    end

    private def self.invalid_prefix?(prefix : String) : Bool
      prefix.empty? || prefix.includes? ' '
    end

    def self.find_in(stack : OOStack(String), prefix : String) : Array(String)
      invalid_prefix_signal if invalid_prefix? prefix

      new(stack, prefix).search
    end

    private def initialize(@stack : OOStack(String), @prefix : String)
      @founded = Array(String).new
      @auxiliar_stack = OOStackUnlimited(String).empty
    end

    protected def search : Array(String)
      find
      restore
      @founded
    end

    private def find : Nil
      move(from_stack: @stack, to_stack: @auxiliar_stack) do |sentence|
        add sentence if match? sentence
      end
    end

    private def move(from_stack : OOStack(String), to_stack : OOStack(String), &) : Nil
      from_stack.size.times do
        to_stack.push from_stack.pop
        yield to_stack.top
      end
    end

    private def add(sentence : String) : Nil
      @founded << sentence
    end

    private def match?(sentence : String) : Bool
      sentence.starts_with? @prefix
    end

    private def restore : Nil
      move(from_stack: @auxiliar_stack, to_stack: @stack) do
        next
      end
    end
  end
end
