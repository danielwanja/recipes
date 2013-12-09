app = angular.module("recipe-project", ['ngRoute', 'rails', 'ui.bootstrap'])

app.factory "Recipe", ["railsResourceFactory", "railsSerializer", (railsResourceFactory, railsSerializer) ->
  railsResourceFactory
    url: "/recipes"
    name: "recipe"
    pluralName: "recipes"
    serializer: railsSerializer(->
      @nestedAttribute "ingredients", "steps"
    )
]

app.config ['$routeProvider', "$httpProvider", ($routeProvider, $httpProvider) ->
  $routeProvider.when("/",
    controller: RecipesController
    templateUrl: "/templates/index.html"
  ).when("/recipe/:id",
    controller: RecipeController
    templateUrl: "/templates/recipe.html"
  ).otherwise redirectTo: "/"

]

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