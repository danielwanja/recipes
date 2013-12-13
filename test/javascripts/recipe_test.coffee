module "Recipe Model Tests"
test "I can create a recipe", ->
  r = Recipes.Recipe.createRecord()
  ok r, "Recipe is defined"

test "I can set properties", ->
  r = Ember.run ->
    Recipes.Recipe.createRecord
      title: 'Taco'
      description: "World's best taco"
  equal 'Taco', r.get('title')
  equal "World's best taco", r.get('description')
