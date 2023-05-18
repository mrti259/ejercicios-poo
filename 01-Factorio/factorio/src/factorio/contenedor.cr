module Factorio
  class Contenedor
    @contenido : Array(Symbol) = Array(Symbol).new

    def recibir(material : Symbol)
      @contenido << material
    end

    def cantidad_de(material : Symbol) : Int
      @contenido.count material
    end

    def cantidad_de_menas : Int
      @contenido.size
    end
  end
end
