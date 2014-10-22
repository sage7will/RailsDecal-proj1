class PokemonController < ApplicationController
  
  def capture
    currPoke = Pokemon.find(params[:id])
    currPoke.trainer_id = current_trainer.id
    currPoke.save
    redirect_to root_path
  end

end
