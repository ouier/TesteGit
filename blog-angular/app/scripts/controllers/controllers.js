'use strict';

var blogAngularControllers = angular.module('blogAngularControllers',[]);

blogAngularControllers.controller('MainCtrl', function ($scope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma','Rafael'
    ];
});

  
