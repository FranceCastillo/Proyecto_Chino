Ext.onReady(function(){
    Ext.QuickTips.init();  

    var filterRow = new Ext.ux.grid.FilterRow({
refilterOnStoreUpdate: true
});


var verCompra = new Ext.data.Store({
    url : 'index.php?r=CompraProd/ver',
    baseParams:{opcion:'ver'},
    reader : new Ext.data.JsonReader({
      root : 'data',
      autoLoad: true,
      fields : [
        {name: 'idCompraProd'},
        {name: 'idProductos'},
        {name: 'unidadProd'},
        {name: 'fechaIngProd'},
        {name: 'costoProd'},
    ]
   }),
   
});
verCompra.load();

var verProductos = new Ext.data.Store({
        proxy: new Ext.data.HttpProxy({
            url : 'index.php?r=stores/verTplProd',
            baseParams:{opcion:'verTplCli'},
        }),
        reader: new Ext.data.JsonReader({
            root: 'data',
            
            fields: [
                'idProductos',
                'codigoProd',
                'nombreProd'
            ]
        })
    });

var modCompras = new Ext.grid.GridPanel({
                renderTo : 'contenidos',
                height : 300,
                width : "100%",
                id:'modificarClientes',
                stripeRows: true,
                shim : false,
                animCollapse : false,
                constrainHeader : true,
                frame : false,
                border : true,
                store : verCompra,
               
                plugins : [filterRow],

                bbar: new Ext.PagingToolbar({
                  store: verCompra,
                  pageSize:10,
                  displayInfo:true
                }),
                columns : [

                  new Ext.grid.RowNumberer(),
                  {
                    header : "idCompraProd",
                    dataIndex : 'idCompraProd',
                    hidden : true
                  },
                   {
                    header : "Producto",
                    dataIndex : 'idProductos',
                    filter:{test: "/^{0}/i"}
                  },
                  
                  {
                    header : "Unidad",
                    dataIndex : 'unidadProd',
                    sortable : true,
                    filter:{test: "/^{0}/i"}
                  },
                  
                  {
                    header : "Costo",
                    dataIndex : 'costoProd',
                    sortable : true,
                    filter:{test: "/^{0}/i"}
                  },
                  {
                    header : "Fecha",
                    dataIndex : 'fechaIngProd',
                    sortable : true,
                    filter:{test: "/^{0}/i"}
                  },

                 
                        
               ]
                        
         });



    var simple = new Ext.FormPanel({
        labelWidth: 75, 
        id: 'regCompras',
        url: 'index.php?r=CompraProd/crear',
        frame:false,
        border:false,
        width: 350,
        style:{"margin-left": "auto","margin-right": "auto"},
        defaults: {width: 230},
        defaultType: 'textfield',
        buttonAlign: 'center',
        items: [
                    {

                        xtype:'combo',
                        store: verProductos,
                        id: 'idProductos',
                        width: 240,
                        valueField: 'idProductos',
                        displayField:'codigoProd',
                        hiddenName: 'idProductos',
                        name:'idProductos',
                        fieldLabel: 'Producto',
                        loadingText: 'Buscando...',
                        hideTrigger:true,
                        itemSelector: 'div.search-item',
                        autoCreate: {tag: 'input', maxlength: '8'},
                        tpl: new Ext.XTemplate(
                            '<tpl for="."><div class="search-item">',
                                '<h3>{codigoProd} - {nombreProd}</h3><br/>',
                            '</div></tpl>'
                        )
       
                },   
        
        {
                fieldLabel: 'Unidad',
                xtype: 'numberfield',
                name: 'unidadProd',
                id:'unidadProd',
                allowBlank: false
            },        {
                fieldLabel: 'Costo',
                xtype: 'numberfield',
                name: 'costoProd',
                id:'costoProd',
                allowBlank: false
            }, 
                    {
                fieldLabel: 'Fecha',
                xtype: 'datefield',
                format: 'Y-m-d',
                name: 'fechaIngProd',
                id:'fechaIngProd',
                allowBlank: false
            }, 
        ],

        fbar: [{
            text: 'Guardar',
            handler: function() {
              if (Ext.getCmp('regCompras').getForm().isValid()) {
                      Ext.getCmp('regCompras').getForm().submit({
                        method : 'POST',
                        params : {
                            opc : 'regCompras'
                        },
                        waitTitle : 'Validando datos',
                        waitMsg : 'Enviando datos..',
                        success : function(form, action) {
                            var data = Ext.util.JSON.decode(action.response.responseText);
                            Ext.Msg.alert('Registro', data.message.reason);
                            Ext.getCmp('regCompras').getForm().reset();
                            verCompra.load();
                        },

                        failure : function(form, action) {
                            var data = Ext.util.JSON.decode(action.response.responseText);
                       Ext.mensajes.msg('Error', data.errors.reason);
                        }
                                     
                                  
                    });

              
                }
            }
        },{
            text: 'Cancel',
            handler: function(){
                simple.getForm().reset();
            }
        }]

    });

    simple.render('contenido');
});
