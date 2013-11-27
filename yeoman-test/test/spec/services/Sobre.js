'use strict';

describe('Service: Sobre', function () {

  // load the service's module
  beforeEach(module('yeomanTestApp'));

  // instantiate service
  var Sobre;
  beforeEach(inject(function (_Sobre_) {
    Sobre = _Sobre_;
  }));

  it('should do something', function () {
    expect(!!Sobre).toBe(true);
  });

});
