Ext.define('ForgeExt.store.PessoaStore',{
	
	extend: 'Ext.data.Store',
	model: 'ForgeExt.model.PessoaModel',
	autoLoad: true,
	
	/*data: [
	   	{id:'1',nome:'Rafael Pereira'},
	   	{id:'2',nome:'Keyla Pereira'},
	   	{id:'3',nome:'Maria Pereira'},
	   	{id:'4',nome:'Joaquim Pereira'},
	   	{id:'5',nome:'Paulo Henrique Pereira'}
	]*/
	
	proxy: {
		type: 'ajax',
		api: {
			read: './../rest/pessoas',
			update: './../rest/pessoas'
		},
		reader:{
			type:'json'
		}
	}

});