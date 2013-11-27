'use strict';

describe('Filter: Sobre', function () {

  // load the filter's module
  beforeEach(module('yeomanTestApp'));

  // initialize a new instance of the filter before each test
  var Sobre;
  beforeEach(inject(function ($filter) {
    Sobre = $filter('Sobre');
  }));

  it('should return the input prefixed with "Sobre filter:"', function () {
    var text = 'angularjs';
    expect(Sobre(text)).toBe('Sobre filter: ' + text);
  });

});
