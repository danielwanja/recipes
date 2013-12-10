#= require angularjs
#= require config

describe "RecipeResourceSpec", ->

  async = new AsyncSpec(this);  # Not needed with Jasmine 2

  $controller = null
  Recipe = null
  $rootScope = null
  $scope = null
  $location = null
  $http = null
  $httpBackend = null

  beforeEach ->
    module('recipe-project')
    inject(["Recipe", "$rootScope", "$http", "$httpBackend", (recipe, rootScope, http, httpBackend) ->
      Recipe = recipe
      $rootScope = rootScope
      $scope = $rootScope.$new()
      $http = http
      $httpBackend = httpBackend
    ])

  async.it "should list recipes", (done)->
    $httpBackend.expectGET(window.fixtures.LIST_CALL.request).respond(200, window.fixtures.LIST_CALL.response)
    Recipe.query().then (result) ->
      expect(result.entries.length).toBe(25)
      expect(result.entries[0].title).toBe("#1 Lemon Bars")
      done()
    $httpBackend.flush()

  async.it "should paginate recipes", (done)->
    $httpBackend.expectGET(window.fixtures.LIST_CALL.request+"?page=2").respond(200, window.fixtures.LIST_CALL.response)
    Recipe.query({page: 2}).then (recipes) ->
      done()
    $httpBackend.flush()


  async.it "should get a recipe", (done)->
    $httpBackend.expectGET(window.fixtures.SHOW_CALL.request).respond(200, window.fixtures.SHOW_CALL.response)
    Recipe.get(2).then (recipe) ->
      expect(recipe.title).toBe("#1 Lemon Bars")
      expect(recipe.ingredients.length).toBe(8)
      expect(recipe.steps.length).toBe(1)
      done()
    $httpBackend.flush()

