json.array!(@recipes) do |recipe|
  json.extract! recipe, :user_id, :title, :description
  json.url recipe_url(recipe, format: :json)
end
