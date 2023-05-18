module Factorio
  class Cinta
    @contenido : Array(Symbol) = Array(Symbol).new
    @destino : Contenedor | Cinta | Nil = nil

    def recibir(material : Symbol)
      @contenido << material
    end

    def cantidad_de(material : Symbol) : Int
      @contenido.count material
    end

    def cantidad_de_menas : Int
      @contenido.size
    end

    def conectar_a(destino)
      @destino = destino
    end

    def mover
      return if @destino.nil?
      @contenido.each do |elemento|
        @destino.not_nil!.recibir elemento
      end
      @contenido.clear
    end
  end
end
