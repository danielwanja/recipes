@RecipesController = ($scope, $rootScope, Recipe, $location, $route, $routeParams) ->

  $scope.load = ->
    Recipe.query().then (recipes) ->
      $scope.recipes = recipes

  $scope.showList = ->

  $scope.showThumbnails = ->

  $scope.showRecipe = (recipe)->
    $location.path "/recipe/#{recipe.id}"

  #--------------------------------------------------------------------
  # Initialization
  #--------------------------------------------------------------------

  $scope.load()

@RecipesController.$inject = ['$scope', '$rootScope', 'Recipe', '$location', '$route', '$routeParams'];
