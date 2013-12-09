@RecipesController = ($scope, $rootScope, Recipe, $location, $route, $routeParams) ->

  $scope.load = (page)->
    options = {}
    options['page'] = page if page?
    options['search'] = $rootScope.searchCriteria if $rootScope.searchCriteria? or $rootScope.searchCriteria == ""
    Recipe.query(options).then (pagination) ->
      $scope.pagination = pagination
      $scope.pagination.hasPrevious = pagination.currentPage>1
      $scope.pagination.hasNext = pagination.currentPage<pagination.totalPages
      $scope.recipes = pagination.entries

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
