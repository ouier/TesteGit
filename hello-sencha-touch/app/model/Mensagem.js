Ext.define('Hello.model.Mensagem',{
	extend: 'Ext.data.Model',
	configs:{
		fields:[
			{
				name:'id',
			},
			{
				name:'from',
			},
			{
				name:'to',
			},
			{
				name:'message',
			},
		]
	}
});