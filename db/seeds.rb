require 'json'
require 'open-uri'

if Rails.env.development?
  Cocktail.destroy_all
  Ingredient.destroy_all
end

puts 'Creating ingredients...'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredient_list = JSON.parse(ingredient_serialized)

# criar um ingrediente para cada hash dentro do array
ingredient_list["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

Cocktail.create(name: "caipirinha")
Cocktail.create(name: "mojito")
Cocktail.create(name: "água com")
