//index.js
var URL = window.location.protocol + "//" + window.location.host + "/" + window.location.pathname.split("/")[1];

$('document').ready(function(){
	
});


function doLogin(){
	
	var login = "sistemafieg\\"+$("#login").val();
	var passw = $("#password").val();
	
	$.ajax({
		url: this.URL+'/login'	,
		data: {'login':login, 'password':passw},
		complete: function(data, xhr, status){
			if(data.responseText=="true"){
				alert("Parabéns! Você conseguiu logar-se pelo LDAP");
			}else{
				alert("Que pena! Você não conseguiu logar-se pelo LDAP :'(");
			}
		}											,
		type: "POST"
	});
	
}