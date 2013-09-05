require([ "dijit/layout/BorderContainer", "dijit/layout/ContentPane",
		"dijit/layout/TabContainer", "dojo/domReady!" ], function(
		BorderContainer, ContentPane, TabContainer) {
	
	// create a BorderContainer as the top widget in the hierarchy
	var bc = new BorderContainer({
		style : "height: 100%; width: 100%;"
	});


	var head = new ContentPane({
		region: 'top',
		style: 'height:32px;width: 100%; border:none; margin:0; padding:0; overflow:none;',
		href:"app/menu.html",
		onLoad: loadMenu
	});
	bc.addChild(head);
	
	// create a ContentPane as the left pane in the BorderContainer
	var cp1 = new ContentPane({
		region : "left",
		style : "width: 100px"
	});
	bc.addChild(cp1);

	// create a ContentPane as the center pane in the BorderContainer
	var cp2 = new TabContainer({
		id: 'tabContainer',
		region : "center",
		content : "how are you?"
	});

	var tab1 = new ContentPane({
		id: 'tab1',
		title : "Tab 1",
		style : "width: 100px",
		href : "app/tab1.html",
		onLoad: loadGrid
	});
	cp2.addChild(tab1);
	var tab2 = new ContentPane({
		id: 'tab2',
		title : "Tab 2",
		style : "width: 100px",
		content : "Tab 2"
	});
	cp2.addChild(tab2);

	bc.addChild(cp2);

	// put the top level widget into the document, and then call startup()
	bc.placeAt(document.body);
	bc.startup();
});

