json.current_page @recipes.current_page
json.total_pages @recipes.total_pages
json.per_page @recipes.limit_value
json.entries do
  json.array!(@recipes) do |recipe|
    json.extract! recipe, :user_id, :id, :title, :description, :image_url
    json.url recipe_url(recipe, format: :json)
  end
end