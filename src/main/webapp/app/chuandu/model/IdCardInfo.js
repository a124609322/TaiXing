Ext.define("app.chuandu.model.IdCardInfo", {
    extend: 'Ext.data.Model',
    fields: [
        {name: 'id', type: 'string'},
        {name: 'name', type: 'string'},
        {name: 'phone', type: 'string'},
        {name: 'email', type: 'string'},
        {name: 'idcardnum', type: 'string'},
        {name: 'cardtype', type: 'int'},
        {name: 'waybillcode1', type: 'string'},
        {name: 'waybillcode2', type: 'string'},
        {name: 'waybillcode3', type: 'string'},
        {name: 'waybillcode4', type: 'string'},
        {name: 'waybillcode5', type: 'string'},
        {name: 'waybillcode6', type: 'string'},
        {name: 'frontcard', type: 'string'},
        {name: 'backcard', type: 'string'},
        {
            name: 'createdate', type: 'string', convert: function (value) {
            if (value) {
                var createTime = Ext.Date.format(new Date(value), "Y-m-d H:i:s");
                return createTime;
            }
            return "";
        }
        },
        {name: 'deleted', type: 'int'},
        {
            name: 'modifydate', type: 'string', convert: function (value) {
            if (value) {
                var createTime = Ext.Date.format(new Date(value), "Y-m-d H:i:s");
                return createTime;
            }
            return "";
        }
        }
    ]
});