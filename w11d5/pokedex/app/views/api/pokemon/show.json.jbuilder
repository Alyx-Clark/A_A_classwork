# json.extract! @pokemon, :name, :attack

json.pokemon do
  json.set! @pokemon.id do
    json.extract! @pokemon, :id, :name, :attack, :defense, :poke_type, :image_url
  end
end

json.extract! @poke_moves, :name

# json.moves do
#   json.set! @pokemon.id do
#     json.extract! @pokemon.poke_moves, :move_id
#   end
# end

# json.items do
#   json.set! @pokemon.id do
#     json.extract! @pokemon.items, :id, :name, :attack
#   end
# end