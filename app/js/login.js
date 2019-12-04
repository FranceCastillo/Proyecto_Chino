
Ext.onReady(function() {
    Ext.QuickTips.init();

    Ext.form.Field.prototype.msgTarget = 'side';


    var form = new Ext.form.FormPanel({
        renderTo: 'login-content',
        labelWidth: 70,
        width   : 300,
        id : 'login',
        xtype : 'form',
        style:{"margin-left": "auto","margin-right": "auto"},
        bodyStyle: 'background:transparent;',
        frame :false,
        border:false,
        url : './php/login.php',
        buttonAlign: 'center',
        items   : [
                    {
                    xtype:'textfield',
                    fieldLabel: 'Usuario',
                    id: 'user',
                    anchor:'90%',
                    allowBlank:false,
                    },
                    {
                    xtype:'textfield',
                    fieldLabel: 'password',
                    id: 'password',
                    inputType:'password',
                    anchor:'90%',
                    allowBlank:false,
                    },                
],
        buttons: [

            {
                text   : 'Entrar',
                handler: function() {
                   if (Ext.getCmp('login').getForm().isValid()) {
                      Ext.getCmp('login').getForm().submit({
                                     method : 'POST',
                                     params:{opc:'logear'},
                                     waitTitle : 'Validando datos',
                                     waitMsg : 'Enviando datos..',
                                     success : function(form, action) {
                                        var data = Ext.util.JSON.decode(action.response.responseText);
                                        window.location = 'index.php'; 
                                        
                                     },
                                     failure : function(form, action) {
                                        var data = Ext.util.JSON.decode(action.response.responseText);
                                        Ext.mensajes.msg('Error',data.errors.reason);
                                        Ext.getCmp('login').getForm().reset();
                                     }
                                     
                                  });
                   }

                }
            },

            {
                text   : 'Limpiar',
                handler: function() {
                    form.form.reset();
                }
            }
        ]
    });
});

