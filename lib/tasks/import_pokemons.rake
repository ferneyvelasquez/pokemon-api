require 'csv'
namespace :import do
    desc " import pokemons ffrom csv"
    task pokemons: :environment do
        counter = 0
        CSV.foreach("pokemon.csv",headers: true) do |row|
            
            number,name,type1,type2,total,hp,attack,defense,spAtk,spDef,speed,generation,legendary = row
            pokemon= Pokemon.create(number: number,name: name,type1: type1,type2: type2,total: total,hp: hp,attack: attack,defense: defense,spAtk: spAtk,spDef: spDef,speed: speed,generation: generation,legendary: legendary)
            counter += 1 if pokemon.persisted?
        end
        puts "imported pokemons: #{counter}"
    end
end