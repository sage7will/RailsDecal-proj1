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

end
