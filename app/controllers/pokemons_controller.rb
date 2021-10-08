class PokemonsController < ApplicationController
    include Paginable
    def index
        
        paginated = paginate(Pokemon.recent)
        options = metaLinks(paginated)
        render json: serializer.new(paginated.items,options)
    end

    def show
        pokemon = Pokemon.find(params[:id])
        render json: serializer.new(pokemon)
        
    end

    def create
        pokemon = Pokemon.new(pokemon_params_create)
        if pokemon.valid? 
            pokemon.save
            render json: pokemon, status: 201
        else
            render json: pokemon.errors,
            status: 422
        end

    end

    def update
        pokemon = Pokemon.find(params[:id])
        pokemon.update!(pokemon_params_update)
        render json: pokemon, status: :ok
    rescue 
        render json: pokemon.errors,
        status: 422
    end

    def destroy
        pokemon = Pokemon.find(params[:id])
        pokemon.destroy
        head :no_content
    rescue 
        render json: {},
        status: 400
    end

    def pokemon_params_create
       params.require(:data)[:attributes].permit(:number,:name,:type1,:type2,:total,:hp,:attack,:defense,:spAtk,:spDef,:speed,:generation,:legendary) || ActionController::Parameters.new
    end

    def pokemon_params_update
        params.require(:data)[:attributes].permit(:name,:type1,:type2,:total,:hp,:attack,:defense,:spAtk,:spDef,:speed,:generation,:legendary) || ActionController::Parameters.new
     end

    def serializer
        PokemonSerializer
    end

   
end