Ext.define('ForgeExt.view.pessoa.Edit',{
	
	extend: 'Ext.window.Window',
	alias: 'widget.pessoaEdit',
	title: 'Editar pessoa',
	layout: 'fit',
	autoShow: true,
	
	initComponent: function(){
		this.items = [
	      	{
	      		xtype: 'form',
	      		items: [
		        	{
		        		xtype: 'textfield',
		        		name: 'id',
		        		fieldLabel: 'Código',
		        		readOnly: true
		        	},
		        	{
		        		xtype: 'textfield',
		        		name: 'nome',
		        		fieldLabel: 'Nome'
		        	}
	      		 ]
	      	}
		 ];
		this.buttons =[
		               {
		            	   text: 'Salvar',
		            	   action: 'salvar'
		               },
		               {
		            	   text: 'Cancelar',
		            	   scope: this,
		            	   handler: this.close
		               }
		];
		this.callParent(arguments);
	}
});