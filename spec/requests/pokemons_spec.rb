require 'rails_helper'

RSpec.describe PokemonsController do
    describe "#index" do
        it "success response" do
            pokemon = create(:pokemon)
            get "/pokemons" 
            expect(response).to  have_http_status(:ok)
            
            expected= json_data.first
            aggregate_failures do
                expect(expected[:id]).to  eq(pokemon.id.to_s)
                expect(expected[:type]).to  eq('pokemon')
                expect(expected[:attributes]).to  eq(number: pokemon.number,
                name: pokemon.name,
                type1: pokemon.type1,
                type2: pokemon.type2,
                total: pokemon.total,
                hp: pokemon.hp,
                attack: pokemon.attack,
                defense: pokemon.defense,
                spAtk: pokemon.spAtk,
                spDef: pokemon.spDef,
                speed: pokemon.speed,
                generation: pokemon.generation,
                legendary: pokemon.legendary)
            end
            
        end

        it 'paginated results' do
            pokemon1, pokemon2, pokemon3 = create_list(:pokemon, 3)
            get "/pokemons", params: {page: {number: 2, size: 1 } }
            expect(json_data.length).to  eq( 1 )
            expect(json_data.first[:id]).to  eq( pokemon2.id.to_s )
        end

    end

    describe "#show" do
        let(:pokemon) { create :pokemon}
        subject {get "/pokemons", params: { id: pokemon.id } }

        it 'success reponse' do
            subject 
            expect(response).to  have_http_status(:ok)
            
        end
        
    end

    describe "#create" do

        context "valid params" do 
            let (:valid_params) do
                {
                    data: {
                        attributes: {
                            number: 1,
                            name: "valid",
                            type1:  "Grass" ,
                            type2:  "Poison" ,
                            total:  318 ,
                            hp:  45 ,
                            attack:  49 ,
                            defense:  49 ,
                            spAtk:  65 ,
                            spDef:  65 ,
                            speed:  45 ,
                            generation:  1 ,
                            legendary:  false 
                        }
                    }
                }
            end
            subject {post "/pokemons", params:  valid_params }
            it 'status is 201' do
                subject
                expect(response).to  have_http_status(201)
            end
        end

        context "invalid params" do
            let (:invalid_params) do
                {
                    data: {
                        attributes: {
                            number: "q",
                            name: "invalid",
                            type1:  "Grass" ,
                            type2:  "Poison" ,
                            total:  318 ,
                            hp:  45 ,
                            attack:  49 ,
                            defense:  49 ,
                            spAtk:  65 ,
                            spDef:  65 ,
                            speed:  45 ,
                            generation:  1 ,
                            legendary:  false 
                        }
                    }
                }
            end
            subject {post "/pokemons", params:  invalid_params }
            it 'status is 422' do
                subject
                expect(response).to  have_http_status(422)
            end
        end
        
    end

end