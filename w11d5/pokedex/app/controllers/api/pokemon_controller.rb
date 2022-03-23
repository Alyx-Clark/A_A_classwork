class Api::PokemonController < ApplicationController

    def index
        @pokemons = Pokemon.all
        render :index
    end


    def show
        @pokemon = Pokemon.find(params[:id])
        # @business = @city.users.includes(:business)
        # @poke_move = Move.find(@pokemon.move_id)
        render :show
    end






end
