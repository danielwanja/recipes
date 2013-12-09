#= require angularjs
#= require main

describe "RemoteCallsSpec", ->


  async = new AsyncSpec(this);  # Not needed with Jasmine 2

  $controller = null
  Restangular = null
  $rootScope = null
  $scope = null
  $location = null
  $http = null
  $httpBackend = null

  beforeEach ->
    module('recipe-project')
    inject(["Restangular", "$rootScope", "$http", "$httpBackend", (restangular, rootScope, http, httpBackend) ->
      Restangular = restangular
      Restangular.setBaseUrl "http://localhost:3000"
      Restangular.setRequestSuffix('.json')
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
    request:  'http://localhost:3000/recipes.json'
    response: JSON.stringify [{"user_id":1,"id":1,"title":"#10 Cake","description":null,"url":"http://localhost:3000/recipes/1.json"},{"user_id":1,"id":2,"title":"#1 Lemon Bars","description":null,"url":"http://localhost:3000/recipes/2.json"},{"user_id":1,"id":3,"title":"$100 Chocolate Cake","description":null,"url":"http://localhost:3000/recipes/3.json"},{"user_id":1,"id":4,"title":"$20,000 Prize-Winning Chili","description":null,"url":"http://localhost:3000/recipes/4.json"},{"user_id":1,"id":5,"title":"$200 Cake","description":null,"url":"http://localhost:3000/recipes/5.json"},{"user_id":1,"id":6,"title":"$200 Salad Dressing","description":null,"url":"http://localhost:3000/recipes/6.json"},{"user_id":1,"id":7,"title":"$25,000 Chili","description":null,"url":"http://localhost:3000/recipes/7.json"},{"user_id":1,"id":8,"title":"$250.00 Cookies (Neiman Marcus)","description":null,"url":"http://localhost:3000/recipes/8.json"},{"user_id":1,"id":9,"title":"$25000 Cookies","description":null,"url":"http://localhost:3000/recipes/9.json"},{"user_id":1,"id":10,"title":"$500.00 Fudge","description":null,"url":"http://localhost:3000/recipes/10.json"},{"user_id":1,"id":11,"title":"$800 Waldorf Red Cake","description":null,"url":"http://localhost:3000/recipes/11.json"},{"user_id":1,"id":12,"title":"'9os Style Chicken Salad","description":null,"url":"http://localhost:3000/recipes/12.json"},{"user_id":1,"id":13,"title":"'egg' Salad","description":null,"url":"http://localhost:3000/recipes/13.json"},{"user_id":1,"id":14,"title":"'gimme Both' Pumpkin-Pecan Pie W/bourbon Whipped Cream","description":null,"url":"http://localhost:3000/recipes/14.json"},{"user_id":1,"id":15,"title":"'ncapriata Di Fave (Fava Bean Puree with Gree","description":null,"url":"http://localhost:3000/recipes/15.json"},{"user_id":1,"id":16,"title":"'ristocrat Pickles' (Aristocrat)","description":null,"url":"http://localhost:3000/recipes/16.json"},{"user_id":1,"id":17,"title":"'sense and Sensibility' Scones","description":null,"url":"http://localhost:3000/recipes/17.json"},{"user_id":1,"id":18,"title":"'twas the Night Before Bread Pudding","description":null,"url":"http://localhost:3000/recipes/18.json"},{"user_id":1,"id":19,"title":"( Bread Mix )","description":null,"url":"http://localhost:3000/recipes/19.json"},{"user_id":1,"id":20,"title":"( From Bread Mix ) Big Soft Pretzels","description":null,"url":"http://localhost:3000/recipes/20.json"},{"user_id":1,"id":21,"title":"( From Bread Mix ) Cinnamon Rolls","description":null,"url":"http://localhost:3000/recipes/21.json"},{"user_id":1,"id":22,"title":"( From Bread Mix ) Homemade White Bread","description":null,"url":"http://localhost:3000/recipes/22.json"},{"user_id":1,"id":23,"title":"( From Bread Mix ) Pan Rolls","description":null,"url":"http://localhost:3000/recipes/23.json"},{"user_id":1,"id":24,"title":"(C\u0026w) Sweet Corn, Black Bean, Bell Peppers, C","description":null,"url":"http://localhost:3000/recipes/24.json"},{"user_id":1,"id":25,"title":"(Crostini Napoletani) Neapolitan-Style Crostini","description":null,"url":"http://localhost:3000/recipes/25.json"}]

  async.it "should list recipes", (done)->
    $httpBackend.expectGET(LIST_CALL.request).respond(200, LIST_CALL.response)
    Restangular.all('recipes').getList().then (recipes) ->
      expect(recipes.length).toBe(25)
      expect(recipes[0].title).toBe("#10 Cake")
      done()
    $httpBackend.flush()

  async.it "should paginate recipes", (done)->
    $httpBackend.expectGET(LIST_CALL.request+"?page=2").respond(200, LIST_CALL.response)
    Restangular.all('recipes').getList({page: 2}).then (recipes) ->
      done()
    $httpBackend.flush()

  LIST_FOR_USER_CALL =
    request:  'http://localhost:3000/users/1/recipes.json'
    response: JSON.stringify [{"user_id":1,"id":1,"title":"#10 Cake","description":null,"url":"http://localhost:3000/recipes/1.json"},{"user_id":1,"id":2,"title":"#1 Lemon Bars","description":null,"url":"http://localhost:3000/recipes/2.json"},{"user_id":1,"id":3,"title":"$100 Chocolate Cake","description":null,"url":"http://localhost:3000/recipes/3.json"},{"user_id":1,"id":4,"title":"$20,000 Prize-Winning Chili","description":null,"url":"http://localhost:3000/recipes/4.json"},{"user_id":1,"id":5,"title":"$200 Cake","description":null,"url":"http://localhost:3000/recipes/5.json"},{"user_id":1,"id":6,"title":"$200 Salad Dressing","description":null,"url":"http://localhost:3000/recipes/6.json"},{"user_id":1,"id":7,"title":"$25,000 Chili","description":null,"url":"http://localhost:3000/recipes/7.json"},{"user_id":1,"id":8,"title":"$250.00 Cookies (Neiman Marcus)","description":null,"url":"http://localhost:3000/recipes/8.json"},{"user_id":1,"id":9,"title":"$25000 Cookies","description":null,"url":"http://localhost:3000/recipes/9.json"},{"user_id":1,"id":10,"title":"$500.00 Fudge","description":null,"url":"http://localhost:3000/recipes/10.json"},{"user_id":1,"id":11,"title":"$800 Waldorf Red Cake","description":null,"url":"http://localhost:3000/recipes/11.json"},{"user_id":1,"id":12,"title":"'9os Style Chicken Salad","description":null,"url":"http://localhost:3000/recipes/12.json"},{"user_id":1,"id":13,"title":"'egg' Salad","description":null,"url":"http://localhost:3000/recipes/13.json"},{"user_id":1,"id":14,"title":"'gimme Both' Pumpkin-Pecan Pie W/bourbon Whipped Cream","description":null,"url":"http://localhost:3000/recipes/14.json"},{"user_id":1,"id":15,"title":"'ncapriata Di Fave (Fava Bean Puree with Gree","description":null,"url":"http://localhost:3000/recipes/15.json"},{"user_id":1,"id":16,"title":"'ristocrat Pickles' (Aristocrat)","description":null,"url":"http://localhost:3000/recipes/16.json"},{"user_id":1,"id":17,"title":"'sense and Sensibility' Scones","description":null,"url":"http://localhost:3000/recipes/17.json"},{"user_id":1,"id":18,"title":"'twas the Night Before Bread Pudding","description":null,"url":"http://localhost:3000/recipes/18.json"},{"user_id":1,"id":19,"title":"( Bread Mix )","description":null,"url":"http://localhost:3000/recipes/19.json"},{"user_id":1,"id":20,"title":"( From Bread Mix ) Big Soft Pretzels","description":null,"url":"http://localhost:3000/recipes/20.json"},{"user_id":1,"id":21,"title":"( From Bread Mix ) Cinnamon Rolls","description":null,"url":"http://localhost:3000/recipes/21.json"},{"user_id":1,"id":22,"title":"( From Bread Mix ) Homemade White Bread","description":null,"url":"http://localhost:3000/recipes/22.json"},{"user_id":1,"id":23,"title":"( From Bread Mix ) Pan Rolls","description":null,"url":"http://localhost:3000/recipes/23.json"},{"user_id":1,"id":24,"title":"(C\u0026w) Sweet Corn, Black Bean, Bell Peppers, C","description":null,"url":"http://localhost:3000/recipes/24.json"},{"user_id":1,"id":25,"title":"(Crostini Napoletani) Neapolitan-Style Crostini","description":null,"url":"http://localhost:3000/recipes/25.json"}]

  async.it "should list recipes for a user", (done)->
    $httpBackend.expectGET(LIST_FOR_USER_CALL.request).respond(200, LIST_FOR_USER_CALL.response)
    Restangular.one('users', 1).all('recipes').getList().then (recipes) ->
      expect(recipes.length).toBe(25)
      expect(recipes[0].title).toBe("#10 Cake")
      done()
    $httpBackend.flush()

  SHOW_CALL =
    request: "http://localhost:3000/users/1/recipes/13.json"
    response: JSON.stringify {"user_id":1,"title":"'egg' Salad","description":null,"created_at":"2013-12-02T23:29:14.351Z","updated_at":"2013-12-02T23:29:14.351Z","ingredients":[{"amount":"8","unit":"ounces","description":"Tofu; medium firm, shredded"},{"amount":"2","unit":null,"description":"Green onions; chopped"},{"amount":"1","unit":"tablespoon","description":"Fresh parsley; chopped, or more"},{"amount":"1","unit":"teaspoon","description":"Curry powder"},{"amount":"1/4","unit":"cups","description":"Mayo or almondaise (use your favourite)"},{"amount":null,"unit":null,"description":"Salt + pepper to taste"},{"amount":null,"unit":null,"description":"Paprika sprinkled on top"}],"steps":[{"position":1,"description":"  From: sylvia@itrc.on.ca\n  \n  Date:   Tue, 30 Jul 1996 10:25:42 -0400\n  Mix the first six together until colour is consistent. For a large group,\n  put lettuce leaves around the bowl first, pack in the 'egg' salad, then\n  form a sunny happy face with a spoon. For some reason, people love it and\n  get a real kick out of this.\n  \n  fatfree digest V96 #210\n  \n  From the Fatfree Vegetarian recipe list.  Downloaded from Glen's MM Recipe\n  Archive, http://www.erols.com/hosey.\n \n"}]}

  async.it "should get a recipe", (done)->
    $httpBackend.expectGET(SHOW_CALL.request).respond(200, SHOW_CALL.response)
    Restangular.one('users', 1).one('recipes', 13).get().then (recipe) ->
      expect(recipe.title).toBe("'egg' Salad")
      expect(recipe.ingredients.length).toBe(7)
      expect(recipe.steps.length).toBe(1)
      done()
    $httpBackend.flush()

