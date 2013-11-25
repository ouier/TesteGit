'use strict';

angular.module('yeomanTestApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute'
])
  .config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'views/main.html',
        controller: 'MainCtrl'
      })
      .when('/contato',{
        templateUrl: 'views/contato.html',
        controller: 'ContatoCtrl'
      })
      .when('/sobre',{
        templateUrl: 'views/sobre.html',
        controller : 'SobreCtrl'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
