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
      # $ctrl = $controller("Demo.RecipeController",
      #   $scope: $scope
      # )
    ])

  it "should add two digits", ->
    expect(1).toBe(1)
    expect(@MyController).not.toBeDefined();

  LIST_CALL =
    request:  '/recipes'
    response: JSON.stringify [{"user_id":1,"id":1,"title":"#10 Cake","description":null,"url":"http://localhost:3000/recipes/1.json"},{"user_id":1,"id":2,"title":"#1 Lemon Bars","description":null,"url":"http://localhost:3000/recipes/2.json"},{"user_id":1,"id":3,"title":"$100 Chocolate Cake","description":null,"url":"http://localhost:3000/recipes/3.json"},{"user_id":1,"id":4,"title":"$20,000 Prize-Winning Chili","description":null,"url":"http://localhost:3000/recipes/4.json"},{"user_id":1,"id":5,"title":"$200 Cake","description":null,"url":"http://localhost:3000/recipes/5.json"},{"user_id":1,"id":6,"title":"$200 Salad Dressing","description":null,"url":"http://localhost:3000/recipes/6.json"},{"user_id":1,"id":7,"title":"$25,000 Chili","description":null,"url":"http://localhost:3000/recipes/7.json"},{"user_id":1,"id":8,"title":"$250.00 Cookies (Neiman Marcus)","description":null,"url":"http://localhost:3000/recipes/8.json"},{"user_id":1,"id":9,"title":"$25000 Cookies","description":null,"url":"http://localhost:3000/recipes/9.json"},{"user_id":1,"id":10,"title":"$500.00 Fudge","description":null,"url":"http://localhost:3000/recipes/10.json"},{"user_id":1,"id":11,"title":"$800 Waldorf Red Cake","description":null,"url":"http://localhost:3000/recipes/11.json"},{"user_id":1,"id":12,"title":"'9os Style Chicken Salad","description":null,"url":"http://localhost:3000/recipes/12.json"},{"user_id":1,"id":13,"title":"'egg' Salad","description":null,"url":"http://localhost:3000/recipes/13.json"},{"user_id":1,"id":14,"title":"'gimme Both' Pumpkin-Pecan Pie W/bourbon Whipped Cream","description":null,"url":"http://localhost:3000/recipes/14.json"},{"user_id":1,"id":15,"title":"'ncapriata Di Fave (Fava Bean Puree with Gree","description":null,"url":"http://localhost:3000/recipes/15.json"},{"user_id":1,"id":16,"title":"'ristocrat Pickles' (Aristocrat)","description":null,"url":"http://localhost:3000/recipes/16.json"},{"user_id":1,"id":17,"title":"'sense and Sensibility' Scones","description":null,"url":"http://localhost:3000/recipes/17.json"},{"user_id":1,"id":18,"title":"'twas the Night Before Bread Pudding","description":null,"url":"http://localhost:3000/recipes/18.json"},{"user_id":1,"id":19,"title":"( Bread Mix )","description":null,"url":"http://localhost:3000/recipes/19.json"},{"user_id":1,"id":20,"title":"( From Bread Mix ) Big Soft Pretzels","description":null,"url":"http://localhost:3000/recipes/20.json"},{"user_id":1,"id":21,"title":"( From Bread Mix ) Cinnamon Rolls","description":null,"url":"http://localhost:3000/recipes/21.json"},{"user_id":1,"id":22,"title":"( From Bread Mix ) Homemade White Bread","description":null,"url":"http://localhost:3000/recipes/22.json"},{"user_id":1,"id":23,"title":"( From Bread Mix ) Pan Rolls","description":null,"url":"http://localhost:3000/recipes/23.json"},{"user_id":1,"id":24,"title":"(C\u0026w) Sweet Corn, Black Bean, Bell Peppers, C","description":null,"url":"http://localhost:3000/recipes/24.json"},{"user_id":1,"id":25,"title":"(Crostini Napoletani) Neapolitan-Style Crostini","description":null,"url":"http://localhost:3000/recipes/25.json"}]

  async.it "should list recipes", (done)->
    $httpBackend.expectGET(LIST_CALL.request).respond(200, LIST_CALL.response)
    Recipe.query().then (recipes) ->
      expect(recipes.length).toBe(25)
      expect(recipes[0].title).toBe("#10 Cake")
      done()
    $httpBackend.flush()

  async.it "should paginate recipes", (done)->
    $httpBackend.expectGET(LIST_CALL.request+"?page=2").respond(200, LIST_CALL.response)
    Recipe.query({page: 2}).then (recipes) ->
      done()
    $httpBackend.flush()

  SHOW_CALL =
    request: "/recipes/2"
    response: {"id":2,"user_id":1,"title":"#1 Lemon Bars","description":null,"created_at":"2013-12-02T23:29:01.054Z","updated_at":"2013-12-02T23:29:01.054Z","ingredients":[{"id":13,"amount":"1 1/2","unit":"cups","description":"All-purpose flour","recipe_id":2},{"id":14,"amount":"2/3","unit":"cups","description":"Powdered sugar","recipe_id":2},{"id":15,"amount":"1 1/2","unit":null,"description":"Sticks butter; softened","recipe_id":2},{"id":16,"amount":"3","unit":null,"description":"Eggs; lightly beaten","recipe_id":2},{"id":17,"amount":"1 1/2","unit":"cups","description":"Granulated sugar","recipe_id":2},{"id":18,"amount":"1","unit":"tablespoons","description":"Flour","recipe_id":2},{"id":19,"amount":"1/4","unit":"cups","description":"Lemon juice","recipe_id":2},{"id":20,"amount":null,"unit":null,"description":"Additional powdered sugar","recipe_id":2}],"steps":[{"id":2,"position":1,"description":"  In bowl combine flour, sugar and butter.  Pat into 9X13 pan.  Bake for 20\n  minutes in a 350F oven.  While it is baking, whisk together eggs, 3 TB\n  flour, sugar and lemon juice.  Pour over crust while crust is still hot.\n  Bake for an additional 20-25 minutes, or until top is golden brown. Cool on\n  a wire rack and dust with additional powdered sugar.\n  \n  Posted to Bakery-Shoppe Digest V1 #206 by novmom@juno.com (Angela\n  Gilliland) on Aug 29, 1997\n \n","recipe_id":2}]}

  async.it "should get a recipe", (done)->
    $httpBackend.expectGET(SHOW_CALL.request).respond(200, SHOW_CALL.response)
    Recipe.get(2).then (recipe) ->
      expect(recipe.title).toBe("#1 Lemon Bars")
      expect(recipe.ingredients.length).toBe(8)
      expect(recipe.steps.length).toBe(1)
      done()
    $httpBackend.flush()

