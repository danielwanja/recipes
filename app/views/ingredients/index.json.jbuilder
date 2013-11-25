json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :recipe_id, :amount, :description
  json.url ingredient_url(ingredient, format: :json)
end
