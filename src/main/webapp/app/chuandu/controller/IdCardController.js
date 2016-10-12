Ext.define("app.chuandu.controller.IdCardController",{
    extend:'Ext.app.ViewController',
    alias:'controller.idcardcontroller',
    closeWindow :function(){
        var win =  this.getView();
        win.close();
    },
    reloadGrid : function(){
        var store = Ext.data.StoreManager.lookup('idcardModuleStore');
        store.loadPage(1);
    },
    resetSearchGrid : function(){
        var panel = this.getView().down("idcardsearchpanel");
        var items = panel.items.items;
        for(var i in items){
            var item = items[i];
            if(item.xtype =="textfield" || item.xtype =="datetimefield" || item.xtype =="textareafield"){
                item.reset();
            }
            if(item.xtype == "fieldcontainer"){
                item.items.items[0].reset();
                item.items.items[1].reset();
            }
        }
    },
    exportIdCardListWindow:function() {
        var grid = this.getView().down('idcardgrid');
        var selections = grid.getSelectionModel().getSelection();
        if(selections.length == 0){
            CommonMsg.warinning({
                msg: "请至少选择一条数据进行操作！"
            })
            return;
        }
        var message = "确定导出 <strong>证件号码记录</strong> 中的";
        var params = "?id=";
        message += '以下 ' + selections.length + ' 条记录吗?';
        message += '<ol>';
        Ext.Array.each(selections, function(record) {
            message += '<li>' + record.get('idcardnum') + '</li>';
            params += record.get('id')+"!";
        });
        message += '</ol>';
        CommonMsg.question({
            title:'确定导出',
            msg : message,
            fn : function(){
                window.open('/admin/idcardinfo/exportIdCardList'+params);
            }
        })
    },
    exportIdCardPicWindow:function() {
        var grid = this.getView().down('idcardgrid');
        var selections = grid.getSelectionModel().getSelection();
        if(selections.length == 0){
            CommonMsg.warinning({
                msg: "请至少选择一条数据进行操作！"
            })
            return;
        }
        var message = "确定导出证件照片 <strong>证件号码记录</strong> 中的";
        var params = "?id=";
        message += '以下 ' + selections.length + ' 条记录吗?';
        message += '<ol>';
        Ext.Array.each(selections, function(record) {
            message += '<li>' + record.get('idcardnum') + '</li>';
            params += record.get('id')+"!";
        });
        message += '</ol>';
        CommonMsg.question({
            title:'确定删除',
            msg : message,
            fn : function(){
                window.open('/admin/idcardinfo/exportIdCardPic'+params);
            }
        })
    },
    deleteIdCardWindow:function() {
        var grid = this.getView().down('idcardgrid');
        var selections = grid.getSelectionModel().getSelection();
        if(selections.length == 0){
            CommonMsg.warinning({
                msg: "请至少选择一条数据进行操作！"
            })
            return;
        }
        var message = "确定删除要删除 <strong>证件记录</strong> 中的";
        var idArray = [];
        message += '以下 ' + selections.length + ' 条记录吗?';
        message += '<ol>';
        Ext.Array.each(selections, function(record) {
            message += '<li>' + record.get('idcardnum') + '</li>';
            idArray.push(record.get('id'));
        });
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
});