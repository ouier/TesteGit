Ext.define('Hello.controller.Mensagem',{
	extend: 'Ext.app.Controller',
	config:{
		views:['Mensagem'],
		models:['Mensagem'],
		stores:['Mensagem'],
		refs:{
			btnEnviarEmail: 'mensagem button#btnEnviarEmail',
			formMsg: 'formpanel#formMsg'
		},
		control:{
			'btnEnviarEmail':{
				tap: 'enviarEmail'
			}
		}
	},
	launch: function(){
		this.getFormMsg().setRecord(Ext.create('Hello.model.Mensagem'));
		this.getFormMsg().reset();
	},
	enviarEmail: function(button, e, eOpts){

		var form = button.up('formpanel');
		var rec = form.getRecord();
		rec.set(form.getValues());

		Ext.Msg.alert('Enviando', JSON.stringify(JSON.stringify(form.getValues())), Ext.emptyFn);
	}
});