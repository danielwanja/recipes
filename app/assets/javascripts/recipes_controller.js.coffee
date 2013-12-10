@RecipesController = ($scope, $rootScope, Recipe, $location, $route, $routeParams) ->

  $scope.load = (page)->
    options = null
    if page?
      options ?= {}
      options['page'] = page
    if $rootScope.searchCriteria? and $rootScope.searchCriteria != ""
      options ?= {}
      options['search'] = $rootScope.searchCriteria
    call = Recipe.query(options)
    call.then (pagination) ->
      $scope.pagination = pagination
      $scope.pagination.hasPrevious = pagination.currentPage>1
      $scope.pagination.hasNext = pagination.currentPage<pagination.totalPages
      $scope.recipes = pagination.entries
    call # Return this for testing purpose. TODO: find a nicer way

  $scope.nextPage = ->
    $scope.load($scope.pagination.currentPage+1) if $scope.pagination.hasNext

  $scope.previousPage = ->
    $scope.load($scope.pagination.currentPage-1) if $scope.pagination.hasPrevious

  $scope.showList = ->

  $scope.showThumbnails = ->

  $scope.showRecipe = (recipe)->
    $location.path "/recipe/#{recipe.id}"

  $scope.$on 'searchEvent', (event,criteria)->
    $scope.load()

  #--------------------------------------------------------------------
  # Initialization
  #--------------------------------------------------------------------

  $scope.load()

@RecipesController.$inject = ['$scope', '$rootScope', 'Recipe', '$location', '$route', '$routeParams'];
