require "./entero"

module Numeros
  struct Cero < Entero
    protected def divide(dividend : Numero) : Numero
      raise Exception.new self.class.can_not_divide_by_zero_error_description
    end

    def fibonacci : Entero
      self.class.with 1
    end

    def zero? : Bool
      true
    end
  end
end
