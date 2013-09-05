function loadGrid() {
	require([ 'dojox/grid/EnhancedGrid', 'dojo/data/ItemFileWriteStore',"dojo/on","dojo/dom" ],
			function(egrid, store,on,Dom) {
		
				var data = {
					identifier : 'id',
					items : []
				};
				var data_list = [ {
					col1 : "normal",
					col2 : false,
				}, {
					col1 : "important",
					col2 : false,
				}, {
					col1 : "important",
					col2 : false,
				} ];
				var rows = 60;
				for ( var i = 0, l = data_list.length; i < rows; i++) {
					data.items.push(dojo.mixin({
						id : i + 1
					}, data_list[i % l]));
				}
				var store = new dojo.data.ItemFileWriteStore({
					data : data
				});

				/* set up layout */
				var layout = [ [ {
					'name' : 'Código',
					'field' : 'id'
				}, {
					'name' : 'Nome',
					'field' : 'nome'
				} ] ];

				/* create a new grid: */
				var grid = new dojox.grid.EnhancedGrid({
					id : 'grid',
					store : store,
					structure : layout,
					rowSelector : '20px',
					style: "width: 90%; height:30em; margin: 0 auto;"
				}, document.createElement('div'));

				/* append the new grid to the div */
				dojo.byId("grid_pessoas").appendChild(grid.domNode);
				
				/* Call startup() to render the grid */
				grid.startup();
				
				dojo.connect(grid, 'onCellDblClick',function(e){
					var item = grid.selection.getSelected()[0];
					console.log(item.col1);
					
				});
				dojo.connect(grid,"onSelected",onSelected);
			});
}

var rowIndex = -1;
function onSelected(idx){
	rowIndex=idx;
}