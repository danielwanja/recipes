app = angular.module("recipe-project", ['ngRoute', 'rails', 'ui.bootstrap', 'ngTagsInput'])

app.config ['$routeProvider', "$httpProvider", ($routeProvider, $httpProvider) ->
  $routeProvider.when("/",
    controller: RecipesController
    templateUrl: "/templates/index.html"
  ).when("/recipe/:id",
    controller: RecipeController
    templateUrl: "/templates/recipe.html"
  ).otherwise redirectTo: "/"

  # protect_from_forgery
  authToken = angular.element(document.querySelector('meta[name="csrf-token"]')).attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken
]

app.factory "Recipe", ["railsResourceFactory", "railsSerializer", (railsResourceFactory, railsSerializer) ->
  Recipe = railsResourceFactory
    url: "/recipes"
    name: "recipe"
    pluralName: "recipes"
    serializer: railsSerializer(->
      @nestedAttribute "ingredients", "steps"
    )
  Recipe.getTags = ->
    @$get @$url() + "/tags.json"
  Recipe
]

# From http://codetunes.com/2013/server-form-validation-with-angular/
app.directive 'serverError', ->
  restrict: 'A'
  require: 'ngModel'
  link: (scope, element, attrs, ctrl) ->
    scope.$watch "selectedRecipe.title", ->
      ctrl.$setValidity('server', true)

app.run ["$rootScope", "Recipe", "$location", ($rootScope, Recipe, $location) ->
  $rootScope.recipes = []
  $rootScope.selectedRecipe = null

  $rootScope.search = (criteria)->
    $rootScope.searchCriteria = if criteria? and criteria != "" then criteria else null
    $rootScope.$broadcast('searchEvent', criteria);
    $location.path "/"

  $rootScope.goHome = ->
    $rootScope.searchCriteria = null
    $location.path "/"

]