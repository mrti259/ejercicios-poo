require "./spec_helper"

describe Factorio do
  extractor_de_carbon = Extractor.new :carbon
  extractor_de_hierro = Extractor.new :hierro
  cinta_de_carbon = Cinta.new
  cinta_de_hierro = Cinta.new
  contenedor = Contenedor.new

  after_each do
    extractor_de_carbon = Extractor.new :carbon
    extractor_de_hierro = Extractor.new :hierro
    cinta_de_carbon = Cinta.new
    cinta_de_hierro = Cinta.new
    contenedor = Contenedor.new
  end

  it "extractor caja" do
    configurar_circuito_extractor_caja(extractor_de_carbon, contenedor)
    hacer_andar_circuito_extractor_caja(extractor_de_carbon, contenedor)

    contenedor.cantidad_de(:carbon).should eq 1
    contenedor.cantidad_de_menas.should eq 1
  end

  it "extractor cinta caja" do
    configurar_circuito_extractor_cinta_caja(
      extractor_de_carbon,
      cinta_de_carbon,
      contenedor
    )
    hacer_andar_circuito_extractor_cinta_caja(
      extractor_de_carbon,
      cinta_de_carbon,
      contenedor
    )

    contenedor.cantidad_de(:carbon).should eq 1
    contenedor.cantidad_de_menas.should eq 1
    cinta_de_carbon.cantidad_de(:carbon).should eq 0
    cinta_de_carbon.cantidad_de_menas.should eq 0
  end

  it "extractor extractor cinta cinta caja" do
    configurar_circuito_extractor_extractor_cinta_cinta_caja(
      extractor_de_carbon,
      extractor_de_hierro,
      cinta_de_carbon,
      cinta_de_hierro,
      contenedor
    )
    hacer_andar_circuito_extractor_extractor_cinta_cinta_caja(
      extractor_de_carbon,
      extractor_de_hierro,
      cinta_de_carbon,
      cinta_de_hierro,
      contenedor
    )

    contenedor.cantidad_de(:carbon).should eq 1
    contenedor.cantidad_de(:hierro).should eq 1
    contenedor.cantidad_de_menas.should eq 2
    cinta_de_carbon.cantidad_de(:carbon).should eq 0
    cinta_de_carbon.cantidad_de_menas.should eq 0
  end
end
