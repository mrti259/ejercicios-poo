require "../numero"

module Numeros
  abstract struct Entero < Numero
    def self.negative_fibonacci_error_description
      "Fibonacci no está definido aquí para Enteros Negativos"
    end

    def self.with(value : Int32)
      return Negativo.new(value) if value.negative?
      return Cero.new(0) if value.zero?
      return Uno.new(1) if value == 1
      NaturalMayorAUno.new(value)
    end

    protected getter value

    protected def initialize(@value : Int32)
    end

    protected def be_added_to(augend : self) : Numero
      self.class.with(augend.value + value)
    end

    protected def be_added_to(augend : Fraccion) : Numero
      self + augend
    end

    protected def subtract(subtrahend : self) : Numero
      self.class.with(subtrahend.value - value)
    end

    protected def subtract(subtrahend : Fraccion) : Numero
      numerator = subtrahend.numerator - subtrahend.denominator * self
      numerator / subtrahend.denominator
    end

    protected def be_multiplied_by(multiplicand : self) : Numero
      self.class.with(multiplicand.value * value)
    end

    protected def be_multiplied_by(multiplicand : Fraccion) : Numero
      numerator = multiplicand.numerator * self
      numerator / multiplicand.denominator
    end

    protected def divide(dividend : self) : Numero
      greatest_common_divisor = greatest_common_divisor_with dividend
      numerator = dividend // greatest_common_divisor
      denominator = self // greatest_common_divisor
      denominator.denominator_for numerator
    end

    protected def denominator_for(numerator : self) : Fraccion
      Fraccion.with_over(numerator, self)
    end

    protected def divide(dividend : Fraccion) : Numero
      denominator = dividend.denominator * self
      dividend.numerator / denominator
    end

    abstract def fibonacci : self

    def negated : Numero
      self.class.with(-value)
    end

    def negative? : Bool
      false
    end

    def zero? : Bool
      false
    end

    def one? : Bool
      false
    end

    def greatest_common_divisor_with(entero : self) : self
      self.class.with(value.gcd(entero.value))
    end

    def //(entero : self) : self
      self.class.with(value // entero.value)
    end
  end
end
