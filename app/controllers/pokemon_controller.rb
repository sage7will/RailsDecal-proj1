class PokemonController < ApplicationController
  
  def capture
    currPoke = Pokemon.find(params[:id])
    currPoke.trainer_id = current_trainer.id
    currPoke.save
    redirect_to root_path
  end

  def damage
    currPoke = Pokemon.find(params[:id])
    currPoke.health = currPoke.health - 10
    currPoke.save
    redirect_to trainer_path(currPoke.trainer_id)
  end

  def heal
    currPoke = Pokemon.find(params[:id])
    currPoke.health = currPoke.health + 10
    currPoke.save
    redirect_to trainer_path(currPoke.trainer_id)
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    @pokemon.health = 100
    @pokemon.trainer_id = current_trainer.id
    @pokemon.level = 1
    if @pokemon.save
      redirect_to trainer_path(current_trainer)
    else
      flash[:error] = @pokemon.errors.full_messages.to_sentence
      redirect_to new_pokemon_path
    end
  end

  def pokemon_params
    params.require(:pokemon).permit(:name)
  end

end
