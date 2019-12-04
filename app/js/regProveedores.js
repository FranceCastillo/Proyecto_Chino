Ext.onReady(function() {
    Ext.QuickTips.init();

var filterRow = new Ext.ux.grid.FilterRow({
refilterOnStoreUpdate: true
});




var verProveedores = new Ext.data.Store({
   url : 'index.php?r=proveedor/ver',
   baseParams:{opcion:'ver'},
   reader : new Ext.data.JsonReader({
      root : 'data',
      autoLoad: true,
      fields : [
        {name: 'idProveedor'},
        {name: 'rifProv'},
        {name: 'nombreProv'},
        {name: 'fechaIngProv'},
        {name: 'correoProv'},
        {name: 'telefonoProv'},
        {name: 'statusProv'},
         ]
   }),
   
});
verProveedores.load();



var editorProveedores = new Ext.ux.grid.RowEditor({
  saveText: 'Guardar',
  listeners : {
    afteredit : function(roweditor, changes, record, rowIndex) {
      Ext.Ajax.request({
        url : 'index.php?r=proveedor/actualizar',
        method : 'POST',
        params : {
          idProveedor : record.get('idProveedor'),
          rifProv : record.get('rifProv'),
          nombreProv : record.get('nombreProv'),
          fechaIngProv : record.get('fechaIngProv'),
          correoProv : record.get('correoProv'),
          telefonoProv : record.get('telefonoProv'),                    
          statusProv : record.get('statusProv'),
        }
      });
      verProveedores.load();
      verProveedores.load();
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



var modProv = new Ext.grid.GridPanel({
                renderTo : 'contenidos',
                height : 435,
                width : "100%",
                id:'modificarProveedores',
                stripeRows: true,
                shim : false,
                animCollapse : false,
                constrainHeader : true,
                frame : false,
                border : true,
                viewConfig : {forceFit : true},
                store : verProveedores,
               
                plugins : [filterRow, editorProveedores],

            
                bbar: new Ext.PagingToolbar({
                  store: verProveedores,
                  pageSize:10,
                  displayInfo:true
                }),

                            
                columns : [

                  new Ext.grid.RowNumberer(),
                  
                  {
                    header : "idProveedor",
                    dataIndex : 'idProveedor',
                    hidden : true
                  },
                  
                  {
                    header : "Rif",
                    dataIndex : 'rifProv',
                    sortable : true,
                    editor: {
                        xtype: 'textfield'
                    },
                    filter:{test: "/^{0}/i"}
                  },
                  
                  {
                    header : "Nombre",
                    dataIndex : 'nombreProv',
                    sortable : true,
                    editor: {
                      xtype: 'textfield'
                    },
                    filter:{test: "/^{0}/i"}
                  },


                   {
                    header : "Fecha Ingreso",
                    dataIndex : 'fechaIngProv',
                    sortable : true,
                    editor: {
                      xtype: 'datefield',
                      format: 'Y-m-d',
                    }
                  },

                  {
                    header : "Correo",
                    dataIndex : 'correoProv',
                    sortable : true,
                    editor: {
                      xtype: 'textfield',
                      vtype: 'email'
                    }
                  },
          
                  {
                    header : "Telefono",
                    dataIndex : 'telefonoProv',
                    sortable : true,
                    editor: {
                      xtype: 'numberfield'
                    }
                  },

                    {
                    header : "Status",
                    dataIndex : 'statusProv',
                    sortable : true,
                    editor: {
                      
                      id: 'statusProv',
                      width: 180,
                      xtype : 'combo',
                      mode : 'local',
                      triggerAction : 'all',
                      editable : false,
                      allowBlank : false,
                      displayField : 'name',
                      valueField : 'value',
                      store : new Ext.data.JsonStore({
                        fields : [ 'name', 'value' ],
                        data : [ {
                          name : 'Activo',
                          value : 'Activo'
                        }, {
                          name : 'Inactivo',
                          value : 'Inactivo'
                        },{
                          name : 'Suspendido',
                          value : 'Suspendido'
                        }]
                      })
                  }
                }]            
         });



 var registroProveedor = new Ext.FormPanel({

     	id : 'regProveedores',
        labelWidth: 75,
        url: 'index.php?r=proveedor/crear',
        frame:false,
        border:false,
        width: 360,
        style:{"margin-left": "auto","margin-right": "auto"},
        defaults: {width: 230},
        defaultType: 'textfield',
        buttonAlign: 'center',
        
        items: [{
                
                fieldLabel: 'Rif',
                id:'rifProv',
                emptyText : 'V-xxxxxxxx-x',
                name: 'rifProv',
                allowBlank:false,
                minLength : 11,
                maxLength : 13,
                blankText: 'Especifique el RIF del Proveedor'
            },{
                fieldLabel: 'Nombre',
                id:'nombreProv',
                name: 'nombreProv',
                allowBlank:false,
                blankText: 'Especifique el Nombre del Proveedor'
            },
                
                 new Ext.form.DateField({
                        fieldLabel: 'Fecha de Registro',
                        id:'fechaIngProv',
                        format: 'Y-m-d',
                	name: 'fechaIngProv',
                        allowBlank:false,
                        blankText: 'Especifique la fecha de ingreso del Proveedor'
                
                    })
             ,{
                fieldLabel: 'Descripcion',
                id:'descripcionProv',
                name: 'descripcionProv',
                xtype: 'textarea',
            }, {
            
            	xtype: 'radiogroup',
            	id:'status',
            fieldLabel: 'Estatus',
            items: [
                {boxLabel: 'Activo', name: 'statusProv', inputValue: 'Activo', checked: true},
                {boxLabel: 'Suspendido', name: 'statusProv', inputValue: 'Suspendido'},
                {boxLabel: 'Inactivo', name: 'statusProv', inputValue: 'Inactivo'},

            ]
                

            },

            {
                xtype: 'numberfield', 
                name: 'telefonoProv', 
                id: 'telefonoProv',
                minLength:9, 
                maxLength:11, 
                allowBlank: false, 
                blankText: 'Especifique el numero de telefono'
            },


            {
                fieldLabel: 'Correo',
                emptyText : 'nombre@dominio.xxx',
                id:'correoProv',
                name: 'correoProv',
                vtype:'email',
                allowBlank:false,
                blankText: 'Especifique el correo del Proveedor'
            },{
                fieldLabel: 'Direccion',
                id:'direccionProv',
                name: 'direccionProv',
                xtype: 'textarea',
                allowBlank:false,
                
                                   
   
                
                
            },
        ],
        

      buttons: [
           
            {
                text   : 'Guardar',
                handler: function() {
                    if (Ext.getCmp('regProveedores').getForm().isValid()) {
                      Ext.getCmp('regProveedores').getForm().submit({
                                     method : 'POST',
                                     params:{opc:'regProveedores'},
                                     waitTitle : 'Validando datos',
                                     waitMsg : 'Enviando datos..',
                                     success : function(form, action) {
                                        var data = Ext.util.JSON.decode(action.response.responseText);
                                         Ext.Msg.alert('Registro',data.message.reason);
                                        Ext.getCmp('regProveedores').getForm().reset();
                                        verProveedores.load();
                                    
                                        
                                     },
                                     failure : function(form, action) {
                                        var data = Ext.util.JSON.decode(action.response.responseText);
                                        Ext.Msg.alert('Error',data.errors.reason);
                                        Ext.getCmp('regProveedores').getForm();
                                     }
                                     
                                  });
                   }
             
                },
            },
            
            {
                text   : 'Limpiar',
                handler: function() {
                    Ext.getCmp('regProveedores').getForm().reset();
                }
            }
        ]
   });


    registroProveedor.render('contenido');

  
}) ;
