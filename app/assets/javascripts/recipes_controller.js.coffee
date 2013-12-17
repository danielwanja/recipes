@RecipesController = ($scope, $rootScope, Recipe, $location, $route, $routeParams) ->

  $scope.load = (page, tag)->
    options = null
    if page?
      options ?= {}
      options['page'] = page
    if tag?
      options ?= {}
      options['tag'] = tag
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

  $scope.showRecipe = (recipe)->
    $location.path "/recipe/#{recipe.id}"

  $scope.nextPage = ->
    $scope.load($scope.pagination.currentPage+1) if $scope.pagination.hasNext

  $scope.previousPage = ->
    $scope.load($scope.pagination.currentPage-1) if $scope.pagination.hasPrevious

  $scope.showList = ->
    $scope.viewStyle = "list"

  $scope.showThumbnails = ->
    $scope.viewStyle = "thumbnails"

  $scope.showCloud = ->
    $scope.previousViewStyle = $scope.viewStyle
    $scope.viewStyle = "cloud"
    $scope.loadCloud()

  $scope.loadCloud = ->
    Recipe.getTags().then (tags) ->
      counts = tags.map (tag) -> tag.count
      max = Math.max(counts...)
      css_classes = ['css1', 'css2', 'css3', 'css4']
      for tag in tags
        index = ((tag.count/max)*(css_classes.length-1))
        tag.index = (if isNaN(index) then 0 else Math.round(index))+1
        tag.css = css_classes[tag.index]
      $scope.tags = tags

  $scope.selectTag = (tag)->
    $scope.viewStyle = $scope.previousViewStyle
    $scope.load(null, tag.name)

  $scope.$on 'searchEvent', (event,criteria)->
    $scope.load()

  #--------------------------------------------------------------------
  # Initialization
  #--------------------------------------------------------------------

  $scope.viewStyle = "thumbnails"
  $scope.load()

@RecipesController.$inject = ['$scope', '$rootScope', 'Recipe', '$location', '$route', '$routeParams'];
