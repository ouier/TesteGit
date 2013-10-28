Ext.define('Hello.view.Hello', {
    extend: 'Ext.tab.Panel',
    xtype: 'hello',
    requires: [

    ],
    config: {
        tabBarPosition: 'bottom',
 	    items:[
	    	{
	    		xtype: "mensagem",
	    		iconCls: "home",
	    		title: "Mensagem"

	    	},
	    	{
	    		xtype: 'panel',
	    		iconCls: 'action',
	    		title: "Conteúdo",
	    		html:[
	    			"Content"
	    		]
	    	}
	    ]
	}
});