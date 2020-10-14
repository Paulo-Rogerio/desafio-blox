namespace :popular do
  desc "Populando Registros"
  task dados: :environment do

    #------------ Usuario ---------#
    User.create!(:email=>"admin@exemplo.com",
                :password => "123456", 
                :password_confirmation => "123456")

    #------------ Salas -----------#
    puts "Cadastrando Salas..."
    5.times do |i|
      Sala.create!(descricao: "Sala 1#{i}")
    end
    puts "Salas cadastradas com sucesso!"

  end

end
