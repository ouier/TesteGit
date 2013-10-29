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
	    		iconCls: "compose",
	    		title: "Mensagem"

	    	},
	    	{
	    		xtype: 'panel',
	    		iconCls: 'info',
	    		title: "Sobre",
	    		items: [
	    			{
		    			xtype: 'panel',
		    			html:[
		    				"Este é apenas um Hello Word. Não há comunicação com o servidor. "+
		    				"Talvez seja implantada esta funcionalidade utilizando REST :D"
		    			].join("")
		    		}
	    		]
	    		
	    	}
	    ]
	}
});