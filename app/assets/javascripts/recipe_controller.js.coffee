@RecipeController = ($scope, $rootScope, Recipe, $location, $routeParams) ->

  $scope.loadRecipe = (id)->
    Recipe.get(id).then (recipe)->
      $scope.selectedRecipe = recipe

  $scope.edit = ->
    $scope.originalResource = angular.copy($scope.selectedRecipe)
    $scope.editing = true

  $scope.cancel = ->
    $scope.selectedRecipe = $scope.originalResource
    $scope.originalResource  = null
    $scope.editing = false

  $scope.addIngredient = ->
    $scope.selectedRecipe.ingredients.push {childIndex: new Date().getTime(), recipeId: $scope.selectedRecipe.id }

  $scope.deleteIngredient = (ingredient)->
    ingredient._destroy = !ingredient._destroy

  $scope.addStep = ->
    $scope.selectedRecipe.steps.push {childIndex: new Date().getTime(), recipeId: $scope.selectedRecipe.id, position:$scope.selectedRecipe.steps.length+1 }

  $scope.deleteStep = (step)->
    step._destroy = !step._destroy

  $scope.save = ->
    $scope.editing = false
    Recipe.setUrl "/users/{{userId}}/recipes/{{id}}"
    try
      call = $scope.selectedRecipe.save({userId: $scope.selectedRecipe.userId})
    finally
      Recipe.setUrl "/recipes"

    call.then (recipe)->
      $scope.editing = false
      $scope.loadRecipe($scope.selectedRecipe.id)

    call.catch (error)->
      msg = "Error:"
      for attr of error.data.errors
          validations = error.data.errors[attr]
          for validation in validations
            msg += "#{attr} #{validation}"
      alert msg
      $scope.editing = true

  $scope.showRecipes = ()->
    $location.path "/"

  #--------------------------------------------------------------------
  # Initialization
  #--------------------------------------------------------------------

  $scope.editing = false
  $scope.loadRecipe($routeParams.id)

@RecipeController.$inject = ['$scope', '$rootScope', 'Recipe', '$location', '$routeParams'];