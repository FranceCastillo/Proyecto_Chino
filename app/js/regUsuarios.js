Ext.onReady(function() {
    Ext.QuickTips.init();

var filterRow = new Ext.ux.grid.FilterRow({
refilterOnStoreUpdate: true
});



Ext.apply(Ext.form.VTypes, {
      password : function(val, field) {
         if (field.initialPassField) {
            var pwd = Ext.getCmp(field.initialPassField);
            return (val == pwd.getValue());
         }
         return true;
      },

      passwordText : 'Las claves no coinciden'
   });


var verusuarios = new Ext.data.Store({
   url : 'index.php?r=usuario/ver',
   baseParams:{opcion:'ver'},
   reader : new Ext.data.JsonReader({
      root : 'data',
      autoLoad: true,
      fields : [

        {name: 'id'}, 
        {name: 'cedula'},
        {name: 'nombre'},
        {name: 'apellido'},
        {name: 'email'},
        {name: 'username'},
        {name: 'password'},
        {name: 'perfil'},
        /*{name: 'login'}, 
        {name: 'clave'}, */
         ]
   }),
   
});
verusuarios.load();



var editorusuarios = new Ext.ux.grid.RowEditor({
  saveText: 'Guardar',
  listeners : {
    afteredit : function(roweditor, changes, record, rowIndex) {
      Ext.Ajax.request({
        url : 'index.php?r=usuario/actualizar',
        method : 'POST',
        params : {
        id : record.get('id'), 
        username : record.get('username'), 
        password : record.get('password'), 
        cedula : record.get('cedula'),
        nombre : record.get('nombre'),
        apellido : record.get('apellido'),
        email : record.get('email'),
        perfil : record.get('perfil'),
     
        }
      });
      verusuarios.load();
      verusuarios.load();
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



var usuarios= new Ext.grid.GridPanel({

       renderTo : 'contenidos',
                height : 338,
                width : '100%',
                id:'usuarios',
                stripeRows: true,
                shim : false,
                animCollapse : true,
                collapsable: true,
                constrainHeader : true,
                frame : false,
                border : false,
        bodyStyle: 'background:transparent;',
                store : verusuarios,
                viewConfig: { forceFit: true },
                plugins : [filterRow, editorusuarios],

            
                bbar: new Ext.PagingToolbar({
                  store: verusuarios,
                  pageSize:10,
                  displayInfo:true
                }),

                            
                columns : [
                new Ext.grid.RowNumberer(),
                          {
              header : 'id',
              dataIndex : 'id',
              hidden: true,      
        },{
          header : 'Cedula',
              dataIndex : 'cedula',
              sortable : true,
              editor: {xtype: 'textfield'},
              filter:{test: '/^{0}/i'}
        },{
          header : 'Nombre',
              dataIndex : 'nombre',
              sortable : true,
              editor: {xtype: 'textfield'},
              filter:{test: '/^{0}/i'}
        },{
          header : 'Apellido',
              dataIndex : 'apellido',
              sortable : true,
              editor: {xtype: 'textfield'},
              filter:{test: '/^{0}/i'}
        },{
          header : 'Email',
              dataIndex : 'email',
              sortable : true,
              editor: {xtype: 'textfield'},
              filter:{test: '/^{0}/i'}
        },{
          header : 'Usuario',
              dataIndex : 'username',
              sortable : true,
              editor: {xtype: 'textfield'},
              filter:{test: '/^{0}/i'}
        },{
          header : 'Clave',
              dataIndex : 'password',
              sortable : true,
              editor: {xtype: 'textfield'},
              filter:{test: '/^{0}/i'}
        },{
          header : 'Perfil',
              dataIndex : 'perfil',
              sortable : true,
              editor: {xtype: 'textfield'},
              filter:{test: '/^{0}/i'}
        },                        ]
                        
         });

    var simple = new Ext.FormPanel({
        id: 'usuarios',
       // name:'usuarios',
        url: 'index.php?r=usuario/crear',
        frame: false,
        border: false,
        labelWidth:120,
        bodyStyle: 'background:transparent;',
        width: '100%',


        

        items: [
          {
            name: 'cedula',
            id: 'cedula',
            xtype: 'numberfield',
            fieldLabel: 'Cedula',
            allowBlank: false,
          },{
            name: 'nombre',
            id: 'nombre',
            xtype: 'textfield',
            fieldLabel: 'Nombre',
            allowBlank: false,
          },{
            name: 'apellido',
            id: 'apellido',
            xtype: 'textfield',
            fieldLabel: 'Apellido',
            allowBlank: false,
          },{
            name: 'email',
            id: 'email',
            xtype: 'textfield',
            fieldLabel: 'Email',
            allowBlank: false,
          },

            {       
                  name: 'username',
                  id: 'username',
                  xtype: 'textfield',
                  fieldLabel: 'Usuario',
                  allowBlank: false
            },


            {
                xtype : 'textfield',
                fieldLabel : 'Clave',
                name : 'password',
                maxLength: 15,
                minLength: 6,
                id : 'password',
                allowBlank: false,
                blankText : 'Clave...',
                vtype : 'password',
                inputType : 'password'
            }, 
        
            {
                xtype : 'textfield',
                fieldLabel : 'Confirmar Clave',
                name : 'claveConfirmar',
                allowBlank: false,
                blankText : 'Repetir clave...',
                inputType : 'password',
                vtype : 'password',
                initialPassField : 'password' 
            },

            {
              name: 'perfil',
              id: 'perfil',
              xtype: 'textfield',
              fieldLabel: 'Perfil',
              allowBlank: false,  
            }

        
        ],

        fbar: [{
            text: 'Guardar',
            handler: function() {
              if (Ext.getCmp('usuarios').getForm().isValid()) {
                      Ext.getCmp('usuarios').getForm().submit({
                        method : 'POST',
                        params : {
                            opc : 'Agregar'
                        },
                        waitTitle : 'Validando datos',
                        waitMsg : 'Enviando datos..',
                        success : function(form, action) {
                            var data = Ext.util.JSON.decode(action.response.responseText);
                            Ext.Msg.alert('Registro', data.message.reason);
                            Ext.getCmp('usuarios').getForm().reset();
                            verusuarios.load();
                        },

                        failure : function(form, action) {
                            //var data = Ext.util.JSON.decode(action.response.responseText);
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

