var URL = window.location.protocol + "//" + window.location.host + "/" + window.location.pathname.split("/")[1];


function FormPessoas($scope,$http){

	$scope.pessoa = {};
	
	
	
	$scope.recarregar = function(){
		$http.get(URL+'/api/pessoas').success(function(data){
			$scope.pessoas = data;
		});
		$scope.pessoa = {};
	};
	
	$scope.recarregar();
	
	$scope.cadastrar= function(pessoa){
		
		pessoa.idade = pessoa.idade.replace(/\D/gi,'');
		$http({
			method: 'POST',
			url: URL+'/api/pessoas',
			data: JSON.stringify(pessoa),
		}).success(function(data){
			console.log(data);
			$scope.recarregar();
		});
	};
	
	
}


/*
$('document').ready(function(){
	document.getElementById('btnCadastro').onclick = cadastrar;
});


function cadastrar(){
	var pessoa = {};
	pessoa.nome = $('#nome').val();
	pessoa.idade = $("#idade").val().replace(/\D/gi,'');
	submit('POST',pessoa,function(data,xhr,status){
		console.log(arguments,args);
	});
	
}


function submit(metodo,object,callback){
	$.ajax({
		url: this.URL+'/api/pessoas'	,
		data: JSON.stringify(object),
		dataType: "application/json"												,
		contentType: 'application/json'										,
		complete: callback											,
		type: metodo
	});
}
*/