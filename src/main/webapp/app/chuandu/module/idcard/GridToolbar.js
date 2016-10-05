Ext.define('app.chuandu.module.idcard.GridToolbar', {
    extend: 'Ext.toolbar.Toolbar',
    alias: 'widget.idcardgridtooolbar',
    initComponent: function () {
        this.items = [
            {
                text: '导出数据到Excel',
                icon: "/image/export-excel.png",
                handler: 'exportIdCardListWindow'
            },
            '-',
            {
                text: '导出证件照片',
                glyph: 0xf1c5,
                handler: 'exportIdCardPicWindow'
            }]
        this.callParent();
    }
});