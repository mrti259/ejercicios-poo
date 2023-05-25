require "./entero"

module Numeros
  struct NaturalMayorAUno < Entero
    protected def initialize(@value : Int32)
    end

    protected def value
      @value
    end

    def fibonacci : Entero
      one = self.class.with 1
      two = self.class.with 2
      (self - one).fibonacci + (self - two).fibonacci
    end
  end
end
