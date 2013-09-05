var myLayout, myTree, myGrid, myFolders, myMenu, myToolbar,myWindow,dhxWins, myForm;

var gl_view_type = "dlist";

var gl_view_bg = "";

var formStructure = [
	                 {type:"settings",position:"label-top"},
	                 {type: "fieldset",name:"pessoaForm", label: "Pessoa", list:[
	                     {type: "input", name: "id", label: 'Código'},
	                     {type:"input", name:"nome", label:"Nome:",list:[
                              {type:"button", name:"salvar", value:"Salvar"},
                              {type:"newcolumn"},
                              {type:"button", name:"cancelar", value:"Cancelar"}]
	                     }
	                 ]}
	             ];

function doOnLoad() {
	// Criando layout
	dhxWins= new dhtmlXWindows();
	myLayout = new dhtmlXLayoutObject(document.body, "2U");
	myLayout.cells("a").setWidth(250);
	myLayout.cells("a").setText("Menu");
	myLayout.cells("b").hideHeader();

	// Criando Menu
	myMenu = myLayout.attachMenu();
	// myMenu.setImagePath("../../dhtmlxMenu/codebase/imgs/");
	myMenu.setIconsPath("icons/");
	myMenu.loadXML("xml/menu.xml");
	myMenu.attachEvent("onClick", menuClick);
}

function menuClick(id, zoneId, casState) {
	console.log(id);
	if (id == "cd_pessoa") {
		showGrid();
	}
}

function showGrid() {
	
	myGrid = myLayout.cells("b").attachGrid();
	myGrid.setImagePath("codebase/imgs/");
	myGrid.setIconsPath("icons/grid/");
	myGrid.setHeader("&nbsp;,Código,Nome");
	myGrid.setColumnIds("#cspan,id,nome");
	myGrid.setInitWidths("30,65,*");
	var pessoas = new dhtmlXDataStore({url:'../rest/pessoas',datatype:'json'});
	var dpPessoas = new dataProcessor("../rest/pessoas");
	pessoas.data.scheme({"id":0,"nome":'','enderecos':[]});
	myGrid.sync(pessoas);
	myGrid.init();
	dpPessoas.init(pessoas);
	win = myLayout.dhxWins.createWindow('win', 20, 10, 320, 240);
	win.attachEvent('onClose',function(e){
		win.hide();
	});
	win.hide();
	myForm = new dhtmlXForm('application',formStructure);
	myForm.bind(myGrid);
	myGrid.attachEvent("onRowDblClicked",function(id){
			win.show();
			//myForm = win.attachForm(formStructure);
			win.attachObject('application');
			win.center();
			win.setText("Editar Pessoa");
			myForm.adjustParentSize();
			myForm.attachEvent("onButtonClick",function(name){
				if(name=='cancelar'){
					win.hide();
				}
				if(name="salvar"){
					dpPessoas.setTransactionMode('POST',true);
					myForm.save();
					win.hide();
					dpPessoas.setTransactionMode('GET',true);
				}
			});
	});
}

