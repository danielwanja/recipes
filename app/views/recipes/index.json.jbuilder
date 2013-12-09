json.array!(@recipes) do |recipe|
  json.extract! recipe, :user_id, :id, :title, :description, :image_url
  json.url recipe_url(recipe, format: :json)
end
