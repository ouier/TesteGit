function loadMenu() {
	require([ "dijit/MenuBar", "dijit/PopupMenuBarItem", "dijit/Menu",
			"dijit/MenuItem", "dijit/DropDownMenu", "dojo/domReady!" ],
			function(MenuBar, PopupMenuBarItem, Menu, MenuItem, DropDownMenu) {
				var pMenuBar = new MenuBar({
					style: 'padding: 0;margin:0;'
				});

				var pSubMenu = new DropDownMenu({});
				pSubMenu.addChild(new MenuItem({
					label : "Tab #1",
					onClick: gotoTab1
				}));
				pSubMenu.addChild(new MenuItem({
					label : "Tab #2",
					onClick: gotoTab2
				}));
				pMenuBar.addChild(new PopupMenuBarItem({
					label : "Cadastros",
					popup : pSubMenu
				}));

				var pSubMenu2 = new DropDownMenu({});
				pSubMenu2.addChild(new MenuItem({
					label : "Recortar",
					iconClass : "dijitEditorIcon dijitEditorIconCut"
				}));
				pSubMenu2.addChild(new MenuItem({
					label : "Copiar",
					iconClass : "dijitEditorIcon dijitEditorIconCopy"
				}));
				pSubMenu2.addChild(new MenuItem({
					label : "Colar",
					iconClass : "dijitEditorIcon dijitEditorIconPaste"
				}));
				pMenuBar.addChild(new PopupMenuBarItem({
					label : "Editar",
					popup : pSubMenu2
				}));

				pMenuBar.placeAt("menu");
				pMenuBar.startup();
			});
}

function gotoTab1(){
	require(["dijit/registry"],function(registry){
		var tabContainer = registry.byId('tabContainer');
		var tab1 = registry.byId('tab1');
		tabContainer.selectChild(tab1);
	});
}

function gotoTab2(){
	require(["dijit/registry"],function(registry){
		var tabContainer = registry.byId('tabContainer');
		var tab2 = registry.byId('tab2');
		tabContainer.selectChild(tab2);
	});
}