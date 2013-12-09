app = angular.module("recipe-project", ['ngRoute', 'rails', 'ui.bootstrap'])

app.factory "Recipe", ["railsResourceFactory", (railsResourceFactory) ->
  railsResourceFactory
    url: "/recipes"
    name: "recipe"
    pluralName: "recipes"
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

app.run ["$rootScope", "Recipe", ($rootScope, Recipe) ->
  $rootScope.recipes = []
  $rootScope.selectedRecipe = null
]