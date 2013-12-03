json.extract! @recipe, :user_id, :title, :description, :created_at, :updated_at
json.ingredients @recipe.ingredients, :amount, :unit, :description
json.steps @recipe.steps, :position, :description
