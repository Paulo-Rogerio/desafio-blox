require 'rails_helper'

RSpec.describe User, :type => :model do
  context "Deve-se Criar um Usuario" do
    it "Criando Sala um Usuario" do
      usuario =  User.create(:email=>"teste@teste.com",
                              :password => "123456", 
                              :password_confirmation => "123456")
      email = "teste@teste.com"
      expect(usuario.reload.email).to eq(email)
    end
  end
end

