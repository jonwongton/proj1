class PokemonsController < ApplicationController
	def new
	end

	def create
		@pokemon = Pokemon.new(pokemon_params)
		@pokemon.level = 1
		@pokemon.health = 100
		@pokemon.trainer_id = current_trainer.id
		if @pokemon.save
			redirect_to trainer_path(Trainer.find(@pokemon.trainer_id))
		else
			flash[:error] = @pokemon.errors.full_messages.to_sentence
			redirect_to new_pokemon_path
		end
	end

	def capture
		@pokemon = Pokemon.find(params[:id])
		@pokemon.trainer_id = current_trainer.id
		@pokemon.save
		redirect_to root_path
	end

	private

	def pokemon_params
		params.require(:pokemon).permit(:name)
	end

end
