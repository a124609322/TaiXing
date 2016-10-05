Ext.define("app.chuandu.module.idcard.Module",{
    extend:'Ext.panel.Panel',
    alias : 'widget.idcardModule',
    requires:['app.chuandu.controller.IdCardController'],
    uses:['app.chuandu.module.idcard.Grid'],
    controller:'idcardcontroller',
    layout:'border',
    initComponent : function(){
        this.items = [
            {
            xtype:'idcardgrid',
            region:'center',
            id:'idcard_grid'
         }
        ]
        this.callParent();
    }
});