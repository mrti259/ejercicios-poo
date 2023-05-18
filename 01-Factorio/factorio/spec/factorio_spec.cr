require "./spec_helper"

describe Factorio do
  it "extractor caja" do
    contexto = Contexto.new
    contexto.configurar_circuito_extractor_caja
    contexto.hacer_andar_circuito_extractor_caja

    contexto.contenedor.cantidad_de(:carbon).should eq 1
    contexto.contenedor.cantidad_de_menas.should eq 1
  end

  it "extractor cinta caja" do
    contexto = Contexto.new
    contexto.configurar_circuito_extractor_cinta_caja
    contexto.hacer_andar_circuito_extractor_cinta_caja

    contexto.contenedor.cantidad_de(:carbon).should eq 1
    contexto.contenedor.cantidad_de_menas.should eq 1
    contexto.cinta.cantidad_de(:carbon).should eq 0
    contexto.cinta.cantidad_de_menas.should eq 0
  end

  it "extractor extractor cinta cinta caja" do
    contexto = Contexto.new
    contexto.configurar_circuito_extractor_extractor_cinta_cinta_caja
    contexto.hacer_andar_circuito_extractor_extractor_cinta_cinta_caja

    contexto.contenedor.cantidad_de(:carbon).should eq 1
    contexto.contenedor.cantidad_de(:hierro).should eq 1
    contexto.contenedor.cantidad_de_menas.should eq 2
    contexto.cinta.cantidad_de(:carbon).should eq 0
    contexto.cinta.cantidad_de_menas.should eq 0
  end
end
