Recipes.RecipeRoute = Ember.Route.extend
  model: (params) -> @store.find('recipe',params.id)
