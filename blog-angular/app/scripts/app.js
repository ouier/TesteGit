'use strict';

angular
  .module('blogAngularApp', [
    'ngResource',
    'ngRoute',
    'blogAngularControllers'
  ])
  .config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'views/main.html',
        controller: 'MainCtrl'
      })
      .when('/sobre', {
        templateUrl: 'views/sobre.html',
        controller: 'SobreCtrl'
      })
      .when('/contato', {
        templateUrl: 'views/contato.html',
        controller: 'SobreCtrl'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
