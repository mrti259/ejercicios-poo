require "spec"
require "../src/factorio"

class Contexto
  include Factorio

  getter contenedor = Contenedor.new
  getter cinta = Cinta.new

  @extractor_de_carbon = Extractor.new :carbon
  @extractor_de_hierro = Extractor.new :hierro
  @cinta_de_hierro = Cinta.new

  def configurar_circuito_extractor_caja
    @extractor_de_carbon.conectar_a @contenedor
  end

  def hacer_andar_circuito_extractor_caja
    @extractor_de_carbon.extraer
  end

  def configurar_circuito_extractor_cinta_caja
    @extractor_de_carbon.conectar_a @cinta
    @cinta.conectar_a @contenedor
  end

  def hacer_andar_circuito_extractor_cinta_caja
    @extractor_de_carbon.extraer
    @cinta.mover
  end

  def configurar_circuito_extractor_extractor_cinta_cinta_caja
    @extractor_de_carbon.conectar_a @cinta
    @extractor_de_hierro.conectar_a @cinta_de_hierro
    @cinta.conectar_a @contenedor
    @cinta_de_hierro.conectar_a @cinta
  end

  def hacer_andar_circuito_extractor_extractor_cinta_cinta_caja
    @extractor_de_carbon.extraer
    @extractor_de_hierro.extraer
    @cinta_de_hierro.mover
    @cinta.mover
  end
end
