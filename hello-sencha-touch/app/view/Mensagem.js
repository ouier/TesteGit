Ext.define('Hello.view.Mensagem',{
	extend: 'Ext.tab.Panel',
	xtype: 'mensagem',
	alias: 'widget.mensagem',
	
	requires: [
        'Ext.TitleBar','Ext.form.FieldSet','Ext.form.Panel','Ext.field.Email'
    ],
    
	config: {
		ui: 'mensagem',
		tabBarPosition: 'top',
		items: [
			{
				title: "Envie email ",
				layout: "vbox",
				xtype: "formpanel",
				itemId: "formMsg",
				items: [
					{
						xtype: "fieldset",
						title: "Mensagem",
						items: [
                                {
                                    xtype: 'emailfield',
                                    required: true,
                                    placeHolder: 'email@example.com',
                                    label: 'Remetente',
                                    name: 'from',
                                    store: 'Mensagem',
                                    displayField: 'from',
                                    valueField: 'from'
                                },
                                {
                                	xtype: 'emailfield',
                                	label: 'E-mail',
                                	required: true,
                                	placeHolder: 'email@example.com',
                                    name: 'to',
                                    store: 'Mensagem',
                                    displayField: 'to',
                                    valueField: 'to'
                                },
                                {
                                    xtype: 'textareafield',
                                    label: 'Mensagem',
                                    name: 'message',
                                    store: 'Mensagem',
                                    displayField: 'message',
                                    valueField: 'message'
                                }
                        ]
					},
					{
                        xtype: 'button',
                        text: 'Enviar',
                        itemId: 'btnEnviarEmail'
                    }
				]

			}
		]
	}
});