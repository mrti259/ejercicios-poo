require "./entero"

module Numeros
  struct Negativo < Entero
    protected def initialize(@value : Int32)
    end

    protected def value
      @value
    end

    protected def divide(dividend : Numero) : Numero
      dividend.negated / negated
    end

    def fibonacci : Entero
      raise Exception.new self.class.negative_fibonacci_error_description
    end

    def negative? : Bool
      true
    end
  end
end
