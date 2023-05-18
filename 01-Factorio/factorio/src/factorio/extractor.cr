module Factorio
  class Extractor
    @destino : Contenedor | Cinta | Nil = nil

    def initialize(@material : Symbol)
    end

    def conectar_a(destino)
      @destino = destino
    end

    def extraer
      return if @destino.nil?
      @destino.not_nil!.recibir @material
    end
  end
end
