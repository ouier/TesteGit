var URL = window.location.protocol + "//" + window.location.host + "/" + window.location.pathname.split("/")[1];

$('document').ready(function(){
	document.getElementById('btnCadastro').onclick = cadastrar;
});


function cadastrar(){
	var pessoa = {};
	pessoa.nome = $('#nome').val();
	pessoa.idade = $("#idade").val().replace(/\D/gi,'');
	console.log('teste');
	submit('POST',pessoa,function(xhr,data,status){
		alert(data.responseText);
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