module Stack
  class SentenceFinderByPrefix
    def self.invalid_prefix_error_description : String
      "Prefix can't be empty"
    end

    private def self.invalid_prefix_signal
      raise Exception.new invalid_prefix_error_description
    end

    private def self.invalid_prefix?(prefix : String) : Bool
      prefix.empty? || prefix.includes? ' '
    end

    def self.find_in(stack : OOStack(String), prefix : String) : Array(String)
      invalid_prefix_signal if invalid_prefix? prefix

      new(stack, prefix).find.restore.founded
    end

    def initialize(@stack : OOStack(String), @prefix : String)
      @founded = Array(String).new
      @auxiliar_stack = OOStack(String).new
    end

    protected def find : self
      move(from_stack: @stack, to_stack: @auxiliar_stack) do |sentence|
        add sentence if match? sentence
      end
    end

    private def move(from_stack : OOStack, to_stack : OOStack, &) : self
      from_stack.size.times do
        to_stack.push from_stack.pop
        yield to_stack.top
      end
      self
    end

    private def add(sentence : String)
      @founded << sentence
    end

    private def match?(sentence : String) : Bool
      sentence.starts_with? @prefix
    end

    protected def restore : self
      move(from_stack: @auxiliar_stack, to_stack: @stack) do
        next
      end
    end

    protected def founded : Array(String)
      @founded
    end
  end
end
