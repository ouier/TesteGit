'use strict';

angular.module('yeomanTestApp')
  .controller('SobreCtrl', function ($scope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
    $scope.author = {'nome':'Rafael de Souza Pereira'};
  });
