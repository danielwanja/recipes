@RecipeController = ($scope, $rootScope, Recipe, $location, $route, $routeParams) ->

  $scope.loadRecipe = (id)->
    Recipe.get(id).then (recipe)->
      $scope.selectedRecipe = recipe

  $scope.save = ->
    r = $scope.selectedRecipe
    r.ingredients[0].amount = "3"
    Recipe.setUrl "/users/{{userId}}/recipes/{{id}}"   # FIXME: not a solution...need two type of resources...or maybe unest just for query
    try
      r.save({userId: r.userId})
    finally
      Recipe.setUrl "/recipes"

  $scope.edit = ->

  $scope.dontEdit = ->

  $scope.showRecipes = ()->
    $location.path "/"

  #--------------------------------------------------------------------
  # Initialization
  #--------------------------------------------------------------------

  $scope.loadRecipe($routeParams.id)

@RecipeController.$inject = ['$scope', '$rootScope', 'Recipe', '$location', '$route', '$routeParams'];