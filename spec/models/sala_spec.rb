require 'rails_helper'

RSpec.describe Sala, :type => :model do
  context "Deve-se Criar uma Sala" do
    it "Criando Sala de Teste" do
      sala = Sala.create!(descricao: "Sala de Teste")
      desc = "Sala de Teste"
      expect(sala.reload.descricao).to eq(desc)
    end
  end
end

