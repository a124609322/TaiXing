Ext.define('app.chuandu.module.idcard.SearchPanel', {
    extend: 'Ext.toolbar.Toolbar',
    alias: 'widget.idcardsearchpanel',
    requires: ['app.ux.DateTime'],
    layout: 'column',
    initComponent: function () {
        this.items = [
            {
                xtype: 'textareafield',
                fieldLabel: '证件号码',
                labelWidth: 80,
                id: 'idcard_search_idnumlist',
                margin: '5 0 5 10',
            }, {
                xtype: 'textfield',
                fieldLabel: '姓名',
                labelWidth: 50,
                id: 'idcard_search_name',
                margin: '5 0 5 10',
            }, {
                xtype: 'textareafield',
                fieldLabel: '单号',
                labelWidth: 50,
                id: 'idcard_search_code',
                margin: '5 0 5 10',
            }, {
                xtype: 'button',
                text: '搜索',
                glyph: 0xf002,
                margin: '5 0 5 10',
                handler: 'reloadGrid'
            }, {
                xtype: 'button',
                text: '重置',
                glyph: 0xf002,
                margin: '5 0 5 10',
                handler: 'resetSearchGrid'
            }
        ]
        this.callParent();
    }
});