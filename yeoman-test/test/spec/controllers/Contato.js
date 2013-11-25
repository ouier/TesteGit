'use strict';

describe('Controller: ContatoctrlCtrl', function () {

  // load the controller's module
  beforeEach(module('yeomanTestApp'));

  var ContatoctrlCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    ContatoctrlCtrl = $controller('ContatoctrlCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
