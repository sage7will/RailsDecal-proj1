class AddHealthToPokemon < ActiveRecord::Migration
  def change
    add_column :pokemons, :health, :integerr
  end
end
