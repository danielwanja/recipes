Recipes.IndexRoute = Ember.Route.extend
  model: -> @store.find('recipe')
