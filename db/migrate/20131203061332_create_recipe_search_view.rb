class CreateRecipeSearchView < ActiveRecord::Migration
  def up
    create_view :recipe_searches, <<-SQL
      select recipes.id, recipes.id as recipe_id, title, recipes.description,
        string_agg(ingredients.description,' ') as ingredients 
      from recipes, ingredients 
      where ingredients.recipe_id = recipes.id 
      group by recipes.id
    SQL
  end

  def down
    drop_view :recipe_searches
  end
end
