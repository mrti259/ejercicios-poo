module Numeros
  abstract struct Numero
    def self.can_not_divide_by_zero_error_description
      "No se puede Dividir por Cero"
    end

    def +(adder : Numero) : Numero
      adder.be_added_to self
    end

    protected abstract def be_added_to(augend : Entero) : Numero
    protected abstract def be_added_to(augend : Fraccion) : Numero

    def -(subtrahend : Numero) : Numero
      subtrahend.subtract self
    end

    protected abstract def subtract(subtrahend : Entero) : Numero
    protected abstract def subtract(subtrahend : Fraccion) : Numero

    def *(multiplier : Numero) : Numero
      multiplier.be_multiplied_by self
    end

    protected abstract def be_multiplied_by(multiplicand : Entero) : Numero
    protected abstract def be_multiplied_by(multiplicand : Fraccion) : Numero

    def /(divisor : Numero) : Numero
      divisor.divide self
    end

    protected abstract def divide(dividend : Entero) : Numero
    protected abstract def divide(dividend : Fraccion) : Numero

    abstract def negated : Numero

    def zero? : Bool
      false
    end

    def one? : Bool
      false
    end
  end
end
