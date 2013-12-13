module "Home page tests",
  setup: -> 
    Recipes.Recipe.FIXTURES = [
      { id: 1, title: 'Taco', description: 'Crunchy and delicious', image_url: 'http://placekitten.com/72/72'}
    ]
    Recipes.reset()

test "Has a search box", ->
  visit('/').then -> equal(find('.recipe-search').length,1,'Has a search box')

test "Has recipes", ->
  visit('/').then -> ok(find('.recipe').length > 0, 'Has Recipes')

test "Links to a recipe", ->
  visit('/').then -> ok(find('.recipe a').length == 1, 'Links to a recipe')
