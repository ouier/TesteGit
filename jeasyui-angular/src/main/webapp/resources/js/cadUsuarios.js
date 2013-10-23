console.log("cadUsuarios carregado com sucesso");

function UsuarioCTRL($scope){

	$scope.usuario = {};

	$scope.novo = function(){
		$scope.usuario = {};
	}

	$scope.cadastrar = function(usuario){
		alert("Você cadastrou :" +JSON.stringify(usuario));
	}

	$scope.fechar = function(){
		$("#content_tab").tabs('close','Cadastro de usuários');
	}
}