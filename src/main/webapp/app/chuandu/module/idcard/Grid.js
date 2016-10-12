Ext.define('app.chuandu.module.idcard.Grid', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.idcardgrid',
    title: '身份证管理',
    uses: ['app.chuandu.module.idcard.GridToolbar','app.chuandu.module.idcard.SearchPanel'],
    forceFit: true,
    enableColumnHide: false,///隐藏列
    multiSelect: true,
    sortableColumns: false,///隐藏排序
    dockedItems: [{
        xtype: 'idcardgridtooolbar',
        dock: 'top'
    },{
        xtype: 'idcardsearchpanel',
        dock: 'top'
    }, {
        xtype: 'pagingtoolbar',
        itemId: 'idcard_pager',
        store: 'idcardModuleStore',
        dock: 'bottom',
        firstText: "First",
        prevText: "Previous",
        nextText: "Next",
        lastText: "Last",
        page: 1,
        totalPage: 'totalCount',
        displayInfo: true,
        emptyMsg: '没有数据',
        displayMsg: '显示 {0} - {1} 条，共计 {2} 条',
    }
    ],
    columns: [{
        xtype: "rownumberer",
        text: "序号",
        width: 50
    }, {
        dataIndex: 'id',
        text: 'ID',
        hidden: true
    }, {
        dataIndex: 'idcardnum',
        text: '证件号码'
    }, {
        dataIndex: 'cardtype',
        text: '证件类型',
        renderer:function(value){
            if(0 == value){
                return "大陆身份证";
            }else if(1 == value){
                return "大陆护照";
            }else if(2 == value){
                return "外国护照";
            }else if(4 == value){
                return "其他";
            }else{
                return "";
            }
        }
    }, {
        dataIndex: 'name',
        text: '姓名'
    }, {
        dataIndex: 'phone',
        text: '电话号码'
    }, {
        dataIndex: 'email',
        text: '电子邮件'
    }, {
        dataIndex: 'waybillcode1',
        text: '订单号1'
    }, {
        dataIndex: 'waybillcode2',
        text: '订单号2'
    }, {
        dataIndex: 'waybillcode3',
        text: '订单号3'
    }, {
        dataIndex: 'waybillcode4',
        text: '订单号4'
    }, {
        dataIndex: 'waybillcode5',
        text: '订单号5'
    }, {
        dataIndex: 'waybillcode6',
        text: '订单号6'
    },{
        xtype: 'actioncolumn',
        header:'操作',
        width: 50,
        align : 'center',
        items: [{
            icon:'/image/iconfont-shanchu.png',
            tooltip:'删除',
            handler: function (grid, rowIndex, colIndex) {
                var rec = grid.getStore().getAt(rowIndex);
                var message = "确定要删除 <strong>证件记录</strong> 中的";
                var idArray = [];
                message += '以下记录吗?';
                message += '<ol>';
                message += '<li>' + rec.get('idcardnum') + '</li>';
                idArray.push(rec.get('id'));
                message += '</ol>';
                CommonMsg.question({
                    title:'确定删除',
                    msg : message,
                    fn : function(){
                        ExtCommon.request({
                            url:'/admin/idcardinfo/delete.json',
                            method:'POST',
                            params:{idList:idArray},
                            success:function(){
                                CommonMsg.info({
                                    msg:'删除成功！',
                                    fn:function(){
                                        var store = Ext.data.StoreManager.lookup('idcardModuleStore');
                                        store.reload({
                                            params:{}
                                        });
                                    }
                                });

                            }
                        });
                    }
                })
            }
        }]
    }],
    store: new Ext.data.JsonStore({
        model: 'app.chuandu.model.IdCardInfo',
        storeId: 'idcardModuleStore',
        autoLoad: false,
        pageSize: 25,
        proxy: {
            type: 'ajax',
            url: '/admin/idcardinfo/list.json',
            method: 'GET',
            extraParams:{
                deleted:0
            },
            reader: {
                type: 'json',
                rootProperty: 'idCardInfoList',
                totalProperty: 'totalCount'
            }
        },
        listeners:{
            beforeload : function(store, operation, eOpts ){
                var idnums = Ext.getCmp('idcard_search_idnumlist');
                var name = Ext.getCmp('idcard_search_name');
                var code = Ext.getCmp('idcard_search_code');
                var params = new Object();
                if(idnums && idnums.getValue()){
                    params.idnums = idnums.getValue();
                }
                if(name && name.getValue()){
                    params.name = name.getValue();
                }
                if(code && code.getValue()){
                    params.code = code.getValue();
                }
                params.deleted = 1;
                store.proxy.extraParams=params;
            }
        }
    }),
    initComponent: function () {
        this.getStore().reload();
        this.callParent(arguments);
    }
});