#= require angularjs
#= require config

describe "RecipesControllerSpec", ->

  async = new AsyncSpec(this);

  $controller = null
  Recipe = null
  $rootScope = null
  $scope = null
  $location = null
  $route = null
  $routeParams = null
  $http = null
  $httpBackend = null

  beforeEach ->
    module('recipe-project')
    inject(["$controller", "$rootScope", "Recipe", "$location", "$route", "$routeParams", "$http", "$httpBackend", (controller, rootScope, recipe, location, route, routeParams, http, httpBackend) ->

      $controller = controller
      Recipe = recipe
      $rootScope = rootScope
      $scope = $rootScope.$new()
      $location = location
      $routeParams = routeParams
      $http = http
      $httpBackend = httpBackend
      $ctrl = $controller("window.RecipesController",
        $scope: $scope
      )
    ])
    # Automatic Load
    $httpBackend.expectGET(window.fixtures.LIST_CALL.request).respond(200, window.fixtures.LIST_CALL.response)

  it "should add two digits", ->
    expect(1).toBe(1)
    expect(window.RecipesController).toBeDefined();

  async.it "should load recipes", (done)->
    $httpBackend.expectGET(window.fixtures.LIST_CALL.request).respond(200, window.fixtures.LIST_CALL.response)
    $httpBackend.expectGET("/templates/index.html").respond(200, "some template")
    $scope.load().then ->
      expect($scope.recipes.length).toBe(25)
      expect($scope.pagination.currentPage).toBe(1)
      expect($scope.pagination.totalPages).toBe(3)
      expect($scope.pagination.perPage).toBe(25)
      expect($scope.pagination.hasPrevious).toBe(false)
      expect($scope.pagination.hasNext).toBe(true)
      done()

    $httpBackend.flush()

  async.it "should go to next page", (done)->
    $scope.pagination = {}
    $scope.pagination.currentPage = 1
    $scope.pagination.hasPrevious = false
    $scope.pagination.hasNext = true

    $httpBackend.expectGET(window.fixtures.LIST_CALL.request+"?page=2").respond(200, window.fixtures.LIST_CALL.response)
    $httpBackend.expectGET("/templates/index.html").respond(200, "some template")
    $scope.nextPage().then ->
      done()

    $httpBackend.flush()

  async.it "should go to previous page", (done)->
    $scope.pagination = {}
    $scope.pagination.currentPage = 2
    $scope.pagination.hasPrevious = true
    $scope.pagination.hasNext = true

    $httpBackend.expectGET(window.fixtures.LIST_CALL.request+"?page=1").respond(200, window.fixtures.LIST_CALL.response)
    $httpBackend.expectGET("/templates/index.html").respond(200, "some template")
    $scope.previousPage().then ->
      done()

    $httpBackend.flush()
