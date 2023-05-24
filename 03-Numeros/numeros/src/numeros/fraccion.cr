require "./numero"

module Numeros
  struct Fraccion < Numero
    protected def self.with_over(numerator : Entero, denominator : Entero)
      new(numerator, denominator)
    end

    getter numerator
    getter denominator

    private def initialize(@numerator : Entero, @denominator : Entero)
    end

    protected def be_added_to(augend : Entero) : Numero
      numerator = @denominator * augend + @numerator
      numerator / @denominator
    end

    protected def be_added_to(augend : self) : Numero
      numerator = @denominator * augend.numerator + @numerator * augend.denominator
      denominator = @denominator * augend.denominator
      numerator / denominator
    end

    protected def subtract(subtrahend : Entero) : Numero
      numerator = subtrahend * @denominator - @numerator
      numerator / @denominator
    end

    protected def subtract(subtrahend : self) : Numero
      numerator = subtrahend.numerator * @denominator - subtrahend.denominator * @numerator
      denominator = subtrahend.denominator * @denominator
      numerator / denominator
    end

    protected def be_multiplied_by(multiplicand : Entero) : Numero
      numerator = multiplicand * @numerator
      numerator / @denominator
    end

    protected def be_multiplied_by(multiplicand : self) : Numero
      numerator = multiplicand.numerator * @numerator
      denominator = multiplicand.denominator * @denominator
      numerator / denominator
    end

    protected def divide(dividend : Entero) : Numero
      numerator = dividend * @denominator
      numerator / @numerator
    end

    protected def divide(dividend : self) : Numero
      numerator = dividend.numerator * @denominator
      denominator = dividend.denominator * @numerator
      numerator / denominator
    end

    def negated : Numero
      @numerator.negated / @denominator
    end
  end
end
