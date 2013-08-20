Ext.define("ForgeExt.controller.PessoaCtrl",{
	
	extend: 'Ext.app.Controller',
	
	views: [
	        'pessoa.List',
	        'pessoa.Edit'
	],
	
	stores:['PessoaStore'],
	models: ['PessoaModel'],
	
	init: function(){
			this.control({
				'pessoaList':{
					itemdblclick: this.editarPessoa
				},
				'pessoaEdit button[action=salvar]':{
					click: this.atualizaPessoa
				}
			});
	},
	
	editarPessoa: function(grid, record){
		console.log('Duplo clique em: '+ record.get('nome'));
		var view = Ext.widget('pessoaEdit'); //Instanciando janela de edição(Edit.js)
		view.down('form').loadRecord(record); //Querying down formulário e preenchendo seus campos
	},
	
	atualizaPessoa: function(button){
		var win = button.up('window');//Querying up janela pai;
		form = win.down('form');//Obtendo formulario filho de win
		record = form.getRecord();//Obtendo objeto do formulario
		values = form.getValues();
		record.set(values);//Salvando os valores do formulário em record
		win.close();
		this.getPessoaStoreStore().sync();
	}
	
	
});