json.extract! @recipe, :id, :user_id, :title, :description, :tag_list, :created_at, :updated_at
json.ingredients @recipe.ingredients, :id, :amount, :unit, :description, :recipe_id
json.steps @recipe.steps, :id, :position, :description, :recipe_id
