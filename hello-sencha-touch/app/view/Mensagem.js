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
				items: [
					{
						xtype: "fieldset",
						title: "Mensagem",
						items: [
                                {
                                    xtype: 'textfield',
                                    label: 'Remetente'
                                },
                                {
                                    xtype: 'emailfield',
                                    label: 'Email'
                                },
                                {
                                    xtype: 'textareafield',
                                    label: 'Mensagem'
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