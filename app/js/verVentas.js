Ext.onReady(function(){
    Ext.QuickTips.init();


var filterRow = new Ext.ux.grid.FilterRow({
  refilterOnStoreUpdate: true
});


var verProductos = new Ext.data.Store({
   url : 'index.php?r=ventas/ver',
   baseParams:{opcion:'ver'},
   reader : new Ext.data.JsonReader({
      root : 'data',
      autoLoad: true,
      fields : [
        {name: 'idProductos'},
        {name: 'idCliente'},
        {name: 'codigoVent'},
        {name: 'cantidadPVent'},
        {name: 'fechaVent'},
        {name: 'totalVent'},
         ]
   }),
   
});
verProductos.load();






var modProductos = new Ext.grid.GridPanel({
                renderTo : 'contenidoss',
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
               
                plugins : [filterRow],

            
                bbar: new Ext.PagingToolbar({
                  store: verProductos,
                  pageSize:10,
                  displayInfo:true
                }),

                            
                columns : [

                  new Ext.grid.RowNumberer(),
                  {
                    header : "Producto",
                    dataIndex : 'idProductos',
                    filter:{test: "/^{0}/i"}
                    //hidden : true
                  },

                  {
                    header : "Cliente",
                    dataIndex : 'idCliente',
                    filter:{test: "/^{0}/i"}
                    //hidden : true
                  },
                  
                  {
                    header : "Codigo",
                    dataIndex : 'codigoVent',
                    sortable : true,
                    filter:{test: "/^{0}/i"}
                  },
                  
                  {
                    header : "Cantidad",
                    dataIndex : 'cantidadPVent',
                    sortable : true,
                    filter:{test: "/^{0}/i"}
                  },


                   {
                    header : "Fecha",
                    dataIndex : 'fechaVent',
                    sortable : true,
                    filter:{test: "/^{0}/i"}
                  },
          
                  {
                    header : "Total",
                    dataIndex : 'totalVent',
                    sortable : true,
                    filter:{test: "/^{0}/i"}
                  },
          
                        
               ]
                        
         });


});