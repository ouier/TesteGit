'use strict';

angular.module('yeomanTestApp')
  .filter('Sobre', function () {
    return function (input) {
      return 'Sobre filter: ' + input;
    };
  });
