require "spec"
require "../src/factorio"

include Factorio

def configurar_circuito_extractor_caja(
  extractor : Extractor,
  contenedor : Contenedor
)
  extractor.conectar_a contenedor
end

def hacer_andar_circuito_extractor_caja(
  extractor : Extractor,
  contenedor : Contenedor
)
  extractor.extraer
end

def configurar_circuito_extractor_cinta_caja(
  extractor : Extractor,
  cinta : Cinta,
  contenedor : Contenedor
)
  extractor.conectar_a cinta
  cinta.conectar_a contenedor
end

def hacer_andar_circuito_extractor_cinta_caja(
  extractor : Extractor,
  cinta : Cinta,
  contenedor : Contenedor
)
  extractor.extraer
  cinta.mover
end

def configurar_circuito_extractor_extractor_cinta_cinta_caja(
  extractor1 : Extractor,
  extractor2 : Extractor,
  cinta1 : Cinta,
  cinta2 : Cinta,
  contenedor : Contenedor
)
  extractor1.conectar_a cinta1
  extractor2.conectar_a cinta2
  cinta2.conectar_a cinta1
  cinta1.conectar_a contenedor
end

def hacer_andar_circuito_extractor_extractor_cinta_cinta_caja(
  extractor1 : Extractor,
  extractor2 : Extractor,
  cinta1 : Cinta,
  cinta2 : Cinta,
  contenedor : Contenedor
)
  extractor1.extraer
  extractor2.extraer
  cinta2.mover
  cinta1.mover
end
