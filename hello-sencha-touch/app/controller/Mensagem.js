Ext.define('Hello.controller.Mensagem',{
	extend: 'Ext.app.Controller',
	config:{
		views:['Mensagem'],
		refs:{
			btnEnviarEmail: 'mensagem button#btnEnviarEmail'
		},
		control:{
			'btnEnviarEmail':{
				tap: 'enviarEmail'
			}
		}
	},
	enviarEmail: function(){
		Ext.Msg.alert('Hello', 'Hello Sencha Touch.', Ext.emptyFn);
	}
});