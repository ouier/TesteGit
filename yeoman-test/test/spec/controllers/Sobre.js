'use strict';

describe('Controller: SobreCtrl', function () {

  // load the controller's module
  beforeEach(module('yeomanTestApp'));

  var SobreCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    SobreCtrl = $controller('SobreCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
