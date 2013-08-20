Ext.application({
	requires: ['Ext.container.Viewport'],
    name: 'ForgeExt',
    appFolder: 'app',
    controllers:['PessoaCtrl'],
    launch: function() {
        Ext.create('Ext.container.Viewport', {
            layout: 'fit',
            items: [
                {
                	xtype: 'pessoaList'
                }
            ]
        });
    }
});