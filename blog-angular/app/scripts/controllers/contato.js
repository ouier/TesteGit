'use strict';

/**
 * Created by rafael on 4/28/14.
 */

blogAngularControllers.controller('ContatoCtrl', ['$scope',function ($scope) {

    $scope.contato = {};

    var contato = $scope.contato;

    $scope.enviarEmail = function(){
        contato.status='E-mail enviado com sucesso, ou não :D';
        setTimeout(function(){$('#status').html('');},3000);
    }

}]);