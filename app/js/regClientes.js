Ext.onReady(function() {
    Ext.QuickTips.init();




var filterRow = new Ext.ux.grid.FilterRow({
    refilterOnStoreUpdate: true
});




var verClientes = new Ext.data.Store({
      url : 'index.php?r=cliente/ver',
   baseParams:{opcion:'ver'},
   reader : new Ext.data.JsonReader({
      root : 'data',
      autoLoad: true,
      fields : [
        {name: 'idCLiente'},
        {name: 'cedulaRifCli'},
        {name: 'nombreCli'},
        {name: 'apellidoCli'},
        {name: 'correoCli'},
        {name: 'telefonoCli'},
         ]
   }),
   
});
verClientes.load();



var editorClientes = new Ext.ux.grid.RowEditor({
  saveText: 'Guardar',
  listeners : {
    afteredit : function(roweditor, changes, record, rowIndex) {
      Ext.Ajax.request({
        url : 'index.php?r=cliente/actualizar',
        method : 'POST',
        params : {
          idCLiente : record.get('idCLiente'),
          cedulaRifCli : record.get('cedulaRifCli'),
          nombreCli : record.get('nombreCli'),
          apellidoCli : record.get('apellidoCli'),
          correoCli : record.get('correoCli'),
          telefonoCli : record.get('telefonoCli'),                    
        }
      });
      
      verClientes.load();
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



var modClientes = new Ext.grid.GridPanel({
                renderTo : 'contenidos',
                height : 420,
                width : "100%",
                id:'clientes',
                stripeRows: true,
                shim : false,
                animCollapse : false,
                constrainHeader : true,
                frame : false,
                border : true,
                viewConfig : {forceFit : true},
                store : verClientes,
               
                plugins : [filterRow, editorClientes],

            
                bbar: new Ext.PagingToolbar({
                  store: verClientes,
                  pageSize:10,
                  displayInfo:true
                }),

                            
                columns : [

                  new Ext.grid.RowNumberer(),
                  
                  {
                    header : "idCLiente",
                    dataIndex : 'idCLiente',
                    hidden : true
                  },
                  
                  {
                    header : "Cedula",
                    dataIndex : 'cedulaRifCli',
                    sortable : true,
                    editor: {
                        xtype: 'numberfield'
                    },
                    filter:{test: "/^{0}/i"}
                  },
                  
                  {
                    header : "Nombre",
                    dataIndex : 'nombreCli',
                    sortable : true,
                    editor: {
                      xtype: 'textfield'
                    },
                    filter:{test: "/^{0}/i"}
                  },


                   {
                    header : "Apellido",
                    dataIndex : 'apellidoCli',
                    sortable : true,
                    editor: {
                      xtype: 'textfield'
                    },
                    filter:{test: "/^{0}/i"}
                  },
          
                  {
                    header : "Telefono",
                    dataIndex : 'telefonoCli',
                    sortable : true,
                    editor: {
                      xtype: 'numberfield'
                    }
                  },
            
            
                  {
                    header : "Correo",
                    dataIndex : 'correoCli',
                    sortable : true,
                    editor: {
                      xtype: 'textfield',
                      vtype: 'email'
                    }
                  },
                        
               ]
                        
         });




    var simple = new Ext.FormPanel({
        labelWidth: 75, 
        id: 'regClientes',
        name: 'regClientes',
        url: 'index.php?r=cliente/crear',
        frame:false,
        border:false,
        width: 350,
        style:{"margin-left": "auto","margin-right": "auto"},
        defaults: {width: 230},
        defaultType: 'textfield',
        buttonAlign: 'center',
        items: [{
                xtype: 'numberfield',
                fieldLabel: 'Cedula',
                id: 'cedulaRifCli',
                name: 'cedulaRifCli',
                minLength:6, 
                maxLength:8,
                allowBlank:false
            }, {
                fieldLabel: 'Nombre',
                name: 'nombreCli',
                id:'nombreCli',
                minLength:3, 
                maxLength:15,
                allowBlank: false
            }, {
                fieldLabel: 'Apellido',
                name: 'apellidoCli',
                minLength:3, 
                maxLength:15,
                id: 'apellidoCli',
                allowBlank: false
            }, {
                xtype: 'radiogroup',
                fieldLabel: 'Genero',
                id: 'generoCli',
                allowBlank: false,
                items: [
                    {boxLabel: 'Masculino', name: 'generoCli', inputValue: "M"},
                    {boxLabel: 'Femenino', name: 'generoCli', inputValue: "F"}
                ]
            }, {
                fieldLabel: 'Correo',
                vtype: 'email',
                id: 'correoCli',
                name: 'correoCli',
                allowBlank: false
            }, 
                {
                    xtype: 'numberfield', 
                    name: 'telefonoCli', 
                    id: 'telefonoCli', 
                    fieldLabel: 'Telefono',
                    minLength:9, 
                    maxLength:11, 
                    allowBlank: false
                },

             {
                xtype: 'textarea',
                fieldLabel: 'Direccion',
                allowBlank: false,
                id: 'direccionCli',
                name: 'direccionCli'
            }, {
                xtype: 'textarea',
                id: 'descripcionCli',
                fieldLabel: 'Descripcion',
                name: 'descripcionCli'
            }
        ],

        fbar: [{
            text: 'Guardar',
            handler: function() {
              if (Ext.getCmp('regClientes').getForm().isValid()) {
                      Ext.getCmp('regClientes').getForm().submit({
                        method : 'POST',
                        params : {
                            opc : 'Agregar'
                        },
                        waitTitle : 'Validando datos',
                        waitMsg : 'Enviando datos..',
                        success : function(form, action) {
                            var data = Ext.util.JSON.decode(action.response.responseText);
                            Ext.Msg.alert('Registro', data.message.reason);
                            Ext.getCmp('regClientes').getForm().reset();
                            verClientes.load();
                        },

                        failure : function(form, action) {
                            var data = Ext.util.JSON.decode(action.response.responseText);
                            Ext.Msg.alert('Error', data.errors.reason);
                        }
                                     
                                  
                    });

              
                }
            }
        },{
            text: 'Cancelar',
            handler: function(){
                simple.getForm().reset();
            }
        }]

    });

    simple.render('contenido');
});
