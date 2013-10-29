Ext.define('Hello.store.Mensagem',{
	extend: 'Ext.data.Store',
	requires:['Hello.model.Mensagem'],
	config: {
		model: 'Hello.model.Mensagem',
		storeId: 'Mensagem'
	}
});