Ext.define('ForgeExt.view.pessoa.List',{
	extend: 'Ext.grid.Panel',
	alias: 'widget.pessoaList',
	title: "Lista de pessoas",
	store: 'PessoaStore',
	initComponent: function(){
		/*this.store = {
			fields: ['id','nome'],
			data: [
			       	{id:'1',nome:'Rafael Pereira'},
			       	{id:'2',nome:'Keyla Pereira'},
			       	{id:'3',nome:'Maria Pereira'},
			       	{id:'4',nome:'Joaquim Pereira'},
			       	{id:'5',nome:'Paulo Henrique Pereira'},
			      ],
			},*/
		this.columns = [
	                      {header: 'Código',  dataIndex: 'id',  flex: 1},
	                      {header: 'Nome', dataIndex: 'nome', flex: 1}
	                  ];
		this.callParent(arguments);
	}
});