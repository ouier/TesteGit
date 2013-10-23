$('document').ready(function(){
	$("#menu").tree({
		onClick: menuClick
	});
});

function menuClick(node){

	$("#content_tab").tabs({
		"border":false,
		"plain":true,
		"fit":true
	});
	
	switch(node.id){
		case 111: cadUsuarios();
		break;
	}
}

function cadUsuarios(){
	if(!$('#content_tab').tabs('getTab','Cadastro de usuários')){
		$("#content_tab").tabs('add',{
			"title":"Cadastro de usuários",
			"href":"resources/content/cadUsuarios.html"
		});
		//loadScript("resources/js/cadUsuarios.js");
		//loadAngularJS();
	}	
}