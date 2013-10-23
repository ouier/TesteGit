function IndexCTRL($scope,$http){
	$scope.menu = {};
}

function loadScript(path){
	var oHead = document.getElementsByTagName('HEAD').item(0);
	var oScript= document.createElement("script");
	oScript.type = "text/javascript";
	oScript.src=path;
	oHead.appendChild(oScript);
}

function loadAngularJS(){
	loadScript('resources/angular/angular.min.js');
}