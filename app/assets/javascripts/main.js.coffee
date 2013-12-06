app = angular.module("recipe-project", ['ngRoute', 'restangular'])  # 'ui.bootstrap'

app.config ['$routeProvider', "$httpProvider", 'RestangularProvider', ($routeProvider, $httpProvider, RestangularProvider) ->
  RestangularProvider.setBaseUrl "/"
  # RestangularProvider.setDefaultHeaders({'Content-Type': 'application/json'})
  RestangularProvider.setRequestSuffix('.json')
]

app.run ["$rootScope", "Restangular", ($rootScope, Restangular) ->
  Restangular.setBaseUrl("http://localhost:3000")
  $rootScope.recipes = []
  # Restangular.all('recipes').getList().then (recipes) ->
  #   $rootScope.recipes = recipes
]