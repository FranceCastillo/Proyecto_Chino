Ext.onReady(function(){
    Ext.QuickTips.init();  

    var filterRow = new Ext.ux.grid.FilterRow({
refilterOnStoreUpdate: true
});


var verCategoria = new Ext.data.Store({
    url : 'index.php?r=categorias/ver',
    baseParams:{opcion:'ver'},
    reader : new Ext.data.JsonReader({
      root : 'data',
      autoLoad: true,
      fields : [
        {name: 'idCategoria'},
        {name: 'nombreCate'},
        {name: 'descripcionCate'},
    ]
   }),
   
});
verCategoria.load();



var editorCategoria = new Ext.ux.grid.RowEditor({
  saveText: 'Guardar',
  listeners : {
    afteredit : function(roweditor, changes, record, rowIndex) {
      Ext.Ajax.request({
        url : 'index.php?r=categorias/actualizar',
        method : 'POST',
        params : {
          idCategoria : record.get('idCategoria'),
          nombreCate : record.get('nombreCate'),
          descripcionCate : record.get('descripcionCate'),
        }
      });
      verCategoria.load();
      verCategoria.load();
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



var modCategorias = new Ext.grid.GridPanel({
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
                store : verCategoria,
               
                plugins : [filterRow, editorCategoria],

            
                bbar: new Ext.PagingToolbar({
                  store: verCategoria,
                  pageSize:10,
                  displayInfo:true
                }),

                            
                columns : [

                  new Ext.grid.RowNumberer(),
                  {
                    header : "idCategoria",
                    dataIndex : 'idCategoria',
                    hidden : true
                  },
                  
                  {
                    header : "Categoria",
                    dataIndex : 'nombreCate',
                    sortable : true,
                    editor: {
                        xtype: 'textfield',
                        allowBlank: false,
                    },
                    filter:{test: "/^{0}/i"}
                  },
                  
                  {
                    header : "Descripcion",
                    dataIndex : 'descripcionCate',
                    sortable : true,
                    editor: {
                      xtype: 'textfield',
                      allowBlank: false,
                    },
                    filter:{test: "/^{0}/i"}
                  },


                 
                        
               ]
                        
         });



    var simple = new Ext.FormPanel({
        labelWidth: 75, 
        id: 'regCategorias',
        url: 'index.php?r=categorias/crear',
        frame:false,
        border:false,
        width: 350,
        style:{"margin-left": "auto","margin-right": "auto"},
        defaults: {width: 230},
        defaultType: 'textfield',
        buttonAlign: 'center',
        items: [{
                fieldLabel: 'Nombre',
                name: 'nombreCate',
                id:'nombreCate',
                minLength:3, 
                maxLength:50,
                allowBlank: false
            }, {
                xtype: 'textarea',
                fieldLabel: 'Descripcion',
                allowBlank: false,
                id: 'descripcionCate',
                name: 'descripcionCate'
            }
        ],

        fbar: [{
            text: 'Guardar',
            handler: function() {
              if (Ext.getCmp('regCategorias').getForm().isValid()) {
                      Ext.getCmp('regCategorias').getForm().submit({
                        method : 'POST',
                        params : {
                            opc : 'regCategorias'
                        },
                        waitTitle : 'Validando datos',
                        waitMsg : 'Enviando datos..',
                        success : function(form, action) {
                            var data = Ext.util.JSON.decode(action.response.responseText);
                            Ext.Msg.alert('Registro', data.message.reason);
                            Ext.getCmp('regCategorias').getForm().reset();
                            verCategoria.load();
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
