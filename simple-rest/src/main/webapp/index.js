var URL = window.location.protocol + "//" + window.location.host + "/" + window.location.pathname.split("/")[1];

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