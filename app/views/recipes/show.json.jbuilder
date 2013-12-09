json.extract! @recipe, :id, :user_id, :title, :description, :created_at, :updated_at
json.ingredients @recipe.ingredients, :id, :amount, :unit, :description
json.steps @recipe.steps, :id, :position, :description
