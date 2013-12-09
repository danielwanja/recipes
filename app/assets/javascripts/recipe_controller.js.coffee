@RecipeController = ($scope, $rootScope, Recipe, $location, $route, $routeParams) ->

  $scope.loadRecipe = (id)->
    Recipe.get(id).then (recipe)->
      $scope.selectedRecipe = recipe

  $scope.edit = ->

  $scope.dontEdit = ->

  $scope.showRecipes = ()->
    $location.path "/"

  #--------------------------------------------------------------------
  # Initialization
  #--------------------------------------------------------------------

  $scope.loadRecipe($routeParams.id)

@RecipeController.$inject = ['$scope', '$rootScope', 'Recipe', '$location', '$route', '$routeParams'];