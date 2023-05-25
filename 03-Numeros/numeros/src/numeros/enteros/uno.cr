require "./entero"

module Numeros
  struct Uno < Entero
    protected def value
      1
    end

    protected def denominator_for(numerator : Entero) : Entero
      numerator
    end

    def fibonacci : Entero
      self
    end

    def one? : Bool
      true
    end
  end
end
