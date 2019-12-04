Ext.onReady(function(){
    Ext.QuickTips.init();


var filterRow = new Ext.ux.grid.FilterRow({
refilterOnStoreUpdate: true
});


var verProductos = new Ext.data.Store({
   url : 'index.php?r=productos/ver',
   baseParams:{opcion:'ver'},
   reader : new Ext.data.JsonReader({
      root : 'data',
      autoLoad: true,
      fields : [
        {name: 'idProductos'},
        {name: 'codigoProd'},
        {name: 'calidad'},
        {name: 'nombreProd'},
        {name: 'idCategoria'},
        {name: 'idProveedor'},
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
        url : 'index.php?r=productos/actualizar',
        method : 'POST',
        params : {
          idProductos : record.get('idProductos'),
          codigoProd : record.get('codigoProd'),
          calidad : record.get('calidad'),
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
                renderTo : 'contenidos',
                height : 545,
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
                    dataIndex : 'idCategoria',
                    sortable : true,
                    filter:{test: "/^{0}/i"}
                  },
          
                   {
                    header : "Calidad",
                    dataIndex : 'calidad',
                    sortable : true,
                    filter:{test: "/^{0}/i"},
                    editor:
	  {
         id: 'calidad2',
         xtype : 'combo',
         mode : 'local',
         triggerAction : 'all',
         editable : false,
         //allowBlank : false,
         fieldLabel : 'Calidad',
         displayField : 'name',
         valueField : 'value',
         store : new Ext.data.JsonStore({
            fields : [ 'name', 'value' ],
            data : [ {
               name : 'Apto',
               value : 'Apto'
            }, {
               name : 'Defectuoso',
               value : 'Defectuoso'
            } ]
         })

      }
                  },

                  {
                    header : "Proveedor",
                    dataIndex : 'idProveedor',
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



var verProv = new Ext.data.Store({
        proxy: new Ext.data.HttpProxy({
            url : 'index.php?r=stores/verTplProv',
            baseParams:{opcion:'verTplProv'},
        }),
        reader: new Ext.data.JsonReader({
            root: 'data',
            
            fields: [
                'idProveedor',
                'rifProv',
                'nombreProv'
            ]
        })
    });



var verCat = new Ext.data.Store({
        proxy: new Ext.data.HttpProxy({
            url : 'index.php?r=stores/verTplCat',
            baseParams:{opcion:'verTplCat'},
        }),
        reader: new Ext.data.JsonReader({
            root: 'data',
            
            fields: [
                'idCategoria',
                'nombreCate',
            ]
        })
    });






    var regProducto = new Ext.FormPanel({
        labelWidth: 75, // label settings here cascade unless overridden
        url : 'index.php?r=productos/crear',
        id:'regProducto',
        frame:false,
        border:false,
        width: 350,
        defaults: {width: 230},
        style:{"margin-left": "auto","margin-right": "auto"},
        buttonAlign: 'center',
        items: [
{
         xtype : 'textfield',
         name : 'codigoProd',
         id : 'codigoProd',
         fieldLabel : 'Codigo',
         allowBlank : false

      },
      
      {
         xtype : 'textfield',
         name : 'referenciaProd',
         id : 'referenciaProd',
         fieldLabel : 'Referencia',
        // allowBlank : false

      },

      {
         xtype : 'textfield',
         name : 'nombreProd',
         id : 'nombreProd',
         fieldLabel : 'Nombre',
         //allowBlank : false

      },

      {
         xtype : 'textfield',
         name : 'marcaProd',
         id : 'marcaProd',
         fieldLabel : 'Marca',
        // allowBlank : false

      },
      
       {
         xtype : 'textfield',
         name : 'modeloProd',
         id : 'modeloProd',
         fieldLabel : 'Modelo',
        // allowBlank : false

      },
      
      {
            xtype : 'textarea',
            name : 'descripcionProd',
            id : 'descripcionProd',
            fieldLabel : 'Descripcion',
            //allowBlank : false

         },
 {
            xtype : 'textarea',
            name : 'ubicacionProd',
            id : 'ubicacionProd',
            fieldLabel : 'Ubicacion',
           // allowBlank : false

         },
	 
	  {
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

      },


	  {
         id: 'calidad',
         xtype : 'combo',
         mode : 'local',
         triggerAction : 'all',
         editable : false,
         //allowBlank : false,
         fieldLabel : 'Calidad',
         displayField : 'name',
         valueField : 'value',
         store : new Ext.data.JsonStore({
            fields : [ 'name', 'value' ],
            data : [ {
               name : 'Apto',
               value : 'Apto'
            }, {
               name : 'Defectuoso',
               value : 'Defectuoso'
            } ]
         })

      },
      {

                        xtype:'combo',
                        store: verCat,
                        id: 'idCategoria',
                        width: 240,
                        valueField: 'idCategoria',
                        displayField:'nombreCate',
                        hiddenName: 'idCategoria',
                        fieldLabel: 'Categoria',
                        loadingText: 'Buscando...',
                        hideTrigger:true,
                        itemSelector: 'div.search-item',
                        autoCreate: {tag: 'input', maxlength: '8'},
                        tpl: new Ext.XTemplate(
                            '<tpl for="."><div class="search-item">',
                                '<h5>{nombreCate}</h5><br/>',
                            '</div></tpl>'
                        )
       
                }, 


              {

                        xtype:'combo',
                        store: verProv,
                        id: 'idProveedor',
                        width: 240,
                        valueField: 'idProveedor',
                        displayField:'rifProv',
                        hiddenName: 'idProveedor',
                        fieldLabel: 'Proveedor',
                        loadingText: 'Buscando...',
                        hideTrigger:true,
                        itemSelector: 'div.search-item',
                        autoCreate: {tag: 'input', maxlength: '8'},
                        tpl: new Ext.XTemplate(
                            '<tpl for="."><div class="search-item">',
                                '<h5>{rifProv} - {nombreProv}</h5><br/>',
                            '</div></tpl>'
                        )
       
                }, 








             {
                xtype : 'numberfield',
                name : 'precioProd',
                id : 'precioProd',
                fieldLabel : 'Precio',
               // allowBlank : false

             },
         {
            xtype : 'numberfield',
            name : 'existenciaProd',
            id : 'existenciaProd',
            fieldLabel : 'Existencia',
           // allowBlank : false

         },

        ],

        fbar: [
           
            {
                text   : 'Guardar',
                handler: function() {
                   if (Ext.getCmp('regProducto').getForm().isValid()) {
                      Ext.getCmp('regProducto').getForm().submit({
                                     method : 'POST',
                                     params : {
                                        opc : 'regProducto'
                                     },
                                     waitTitle : 'Validando datos',
                                     waitMsg : 'Enviando datos..',
                                     success : function(form, action) {
                                        var data = Ext.util.JSON.decode(action.response.responseText);
                                        Ext.Msg.alert('Confirmacion',data.message.reason);                                     
	                                     Ext.getCmp('regProducto').getForm().reset();
                                       verProductos.load();
                                     },
                                     failure : function(form, action) {
                                        var data = Ext.util.JSON.decode(action.response.responseText);
                                        Ext.mensajes.msg('Error',data.errors.reason);                                     

                                     }
                                  });
                   }
             
                }
            },
            
            {
                text   : 'Limpiar',
                handler: function() {
                    Ext.getCmp('regProducto').getForm().reset();
                }
            }
        ]

    });

    regProducto.render('contenido');
});
