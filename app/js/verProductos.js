Ext.onReady(function() {
    Ext.QuickTips.init();

var filterRow = new Ext.ux.grid.FilterRow({
refilterOnStoreUpdate: true
});


var verProductos = new Ext.data.Store({
   url : './php/stores.php?opc=verProductos',
   reader : new Ext.data.JsonReader({
      root : 'data',
      autoLoad: true,
      fields : [
        {name: 'idProductos'},
        {name: 'codigoProd'},
        {name: 'nombreProd'},
        {name: 'categoria'},
        {name: 'proveedor'},
        {name: 'referenciaProd'},
        {name: 'marcaProd'},
        {name: 'modeloProd'},
        {name: 'descripcionProd'},
        {name: 'tipoProd'},
        {name: 'ubicacionProd'},
        {name: 'precioProd'},
        {name: 'existenciaProd'},
         ]
   }),
   
});
verProductos.load();



var editorProductos = new Ext.ux.grid.RowEditor({
  saveText: 'Guardar',
  listeners : {
    afteredit : function(roweditor, changes, record, rowIndex) {
      Ext.Ajax.request({
        url : './php/regProductos.php?opc=modProd',
        method : 'POST',
        params : {
          idProductos : record.get('idProductos'),
          codigoProd : record.get('codigoProd'),
          nombreProd : record.get('nombreProd'),
          referenciaProd : record.get('referenciaProd'),
          marcaProd : record.get('marcaProd'),
          modeloProd : record.get('modeloProd'), 
          descripcionProd : record.get('descripcionProd'),
          tipoProd : record.get('tipoProd'),
          ubicacionProd : record.get('ubicacionProd'),
          precioProd : record.get('precioProd'),
          existenciaProd : record.get('existenciaProd'),                   
        }
      });
      Ext.mensajes.msg("Confirmacion","Datos actualizados!")
      verProductos.load();
      verProductos.load();
    }
  },
  canceledit : function(rowEditor) {
    var record = this.store.getAt(rowEditor.rowIndex);
    if (record.phantom) {
      this.store.removeAt(rowEditor.rowIndex);
      this.getView().refresh();
    }
    return true;
  }
        
});



var modProductos = new Ext.grid.GridPanel({
                renderTo : 'contenido',
                height : 500,
                width : "100%",
                id:'modificarClientes',
                stripeRows: true,
                shim : false,
                animCollapse : false,
                constrainHeader : true,
                frame : false,
                border : true,
                store : verProductos,
               
                plugins : [filterRow, editorProductos],

            
                bbar: new Ext.PagingToolbar({
                  store: verProductos,
                  pageSize:10,
                  displayInfo:true
                }),

                            
                columns : [

                  new Ext.grid.RowNumberer(),
                  {
                    header : "idProductos",
                    dataIndex : 'idProductos',
                    hidden : true
                  },
                  
                  {
                    header : "Codigo",
                    dataIndex : 'codigoProd',
                    sortable : true,
                    editor: {
                        xtype: 'textfield'
                    },
                    filter:{test: "/^{0}/i"}
                  },
                  
                  {
                    header : "Nombre",
                    dataIndex : 'nombreProd',
                    sortable : true,
                    editor: {
                      xtype: 'textfield'
                    },
                    filter:{test: "/^{0}/i"}
                  },


                   {
                    header : "Categoria",
                    dataIndex : 'categoria',
                    sortable : true,
                    filter:{test: "/^{0}/i"}
                  },
          
                  {
                    header : "Proveedor",
                    dataIndex : 'proveedor',
                    sortable : true,
                    filter:{test: "/^{0}/i"}
                  },
            
            
                  {
                    header : "Referencia",
                    dataIndex : 'referenciaProd',
                    sortable : true,
                    filter:{test: "/^{0}/i"},
                    editor: {
                      xtype: 'textfield'
                    }
                  },         
         {
                    header : "Marca",
                    dataIndex : 'marcaProd',
                    sortable : true,
                    filter:{test: "/^{0}/i"},
                    editor: {
                      xtype: 'textfield'
                    }
                  },                  {
                    header : "Modelo",
                    dataIndex : 'modeloProd',
                    sortable : true,
                    filter:{test: "/^{0}/i"},
                    editor: {
                      xtype: 'textfield'
                    }
                  },                  {
                    header : "Descripcion",
                    dataIndex : 'descripcionProd',
                    sortable : true,
                    editor: {
                      xtype: 'textfield'
                    }
                  },                  {
                    header : "Tipo",
                    dataIndex : 'tipoProd',
                    sortable : true,
                    filter:{test: "/^{0}/i"},
                    editor: {
                      id: 'tipoProd',
         xtype : 'combo',
         mode : 'local',
         triggerAction : 'all',
         editable : false,
         //allowBlank : false,
         fieldLabel : 'Tipo',
         displayField : 'name',
         valueField : 'value',
         store : new Ext.data.JsonStore({
            fields : [ 'name', 'value' ],
            data : [ {
               name : 'Nacional',
               value : 'Nacional'
            }, {
               name : 'Importado',
               value : 'Importado'
            } ]
         })
                    }
                  },                  {
                    header : "Ubicacion",
                    dataIndex : 'ubicacionProd',
                    sortable : true,
                    editor: {
                      xtype: 'textfield'
                    }
                  },             
     {
                    header : "Precio",
                    dataIndex : 'precioProd',
                    sortable : true,
                    editor: {
                      xtype: 'textfield'
                    }
                  },                  {
                    header : "Existencia",
                    dataIndex : 'existenciaProd',
                    sortable : true,
                    editor: {
                      xtype: 'textfield'
                    }
                  },
                        
               ]
                        
         });

});
