Ext.onReady(function() {




    Ext.QuickTips.init();
    Ext.Ajax.timeout = 300000; // 5 minutos

    var summary = new Ext.ux.grid.GroupSummary();
    

    var guardar = function() {
        var modified = grid.getStore().getModifiedRecords();
        if (!Ext.isEmpty(modified)) {
            var recordsToSend = [];
            Ext.each(modified, function(record) {
                recordsToSend.push(Ext.apply(record.data));
            });

            recordsToSend = Ext.encode(recordsToSend);
        }

        if (Ext.getCmp('formpanel2').getForm().isValid()) {
            Ext.getCmp('formpanel2').getForm().submit(
                    {

                        params : {
                            opc : 'Agregar',
                            productosFact : recordsToSend,
                        },
                        waitTitle : 'Validando datos',
                        waitMsg : 'Enviando datos..',
                        success : function(form, action) { // Función que se ejecutara si el parámetro devuelto por PHP es TRUE
                            var data = Ext.util.JSON.decode(action.response.responseText); // Captura la respuesta devuelta
                            //Ext.Msg.alert('Confirmación', data.message.reason); // Muestra mensaje
                            

                            Ext.Msg.show({
                                title:  data.message.reason,
                                msg: 'Desea realizar otra venta?',
                                buttons: { ok: '<b>Si</b>', cancel: 'No' },
                                fn: function(btn) {
                                    if(btn == 'ok') {
                                        location.href = '?r=ventas/index';
                                    }else{
                                        location.href = '?r=ventas/ver';
                                    }
                                },
                               icon: Ext.MessageBox.QUESTION
                            });

                        },
                        failure : function(form, action) { // Función que se ejecutara si el parámetro devuelto por PHP es FALSE
                            var data = Ext.util.JSON.decode(action.response.responseText);
                            Ext.Msg.show({ // Muestra mensaje
                                title : 'Error',
                                msg : data.errors.reason,
                                buttons : Ext.Msg.OK,
                                icon : Ext.MessageBox.ERROR
                            });
                        }

                    });
        } else {
            Ext.Msg.alert('Error', 'Debe llenar el formulario!!');
        }

    };







    var step2 = function() {
        var modified = grid.getStore().getModifiedRecords();
        if (!Ext.isEmpty(modified)) {
            

            Ext.getCmp('codigoProd').hide();
            Ext.getCmp('nombreProd').hide();
            Ext.getCmp('marcaProd').hide();
            Ext.getCmp('modeloProd').hide();
            Ext.getCmp('tipoProd').hide();
            Ext.getCmp('cantidadPVent').hide();
            Ext.getCmp('totalVent').hide();
           // Ext.getCmp('descripcionProd').hide();
            Ext.getCmp('producto').hide();
            Ext.getCmp('ubicacionProd').hide();
            Ext.getCmp('existenciaProd').hide();
            Ext.getCmp('precioProd').hide();
            Ext.getCmp('cliente').show();
            Ext.getCmp('nombreCli').show();
            Ext.getCmp('apellidoCli').show();
            

            var agregar = Ext.getCmp('agregar');
            agregar.hide();
            var limpiar = Ext.getCmp('limpiar');
            limpiar.hide();
            var siguiente = Ext.getCmp('siguiente');
            siguiente.hide();
            var save = Ext.getCmp('save');
            save.show();
        } else {
            Ext.Msg.alert('Error', 'Debe seleccionar por lo menos un producto!!');
        }
    };




    var setearProducto = function(record, index) {
        if (this.fireEvent('beforeselect', this, record, index) !== false) {
           // var idProductos = String.format(record.data.idProductos);

            new Ext.getCmp('formpanel').getForm().setValues({
                codigoProd: String.format(record.data.codigoProd),
                idProd: String.format(record.data.idProductos),
                nombreProd: String.format(record.data.nombreProd),
                marcaProd: String.format(record.data.marcaProd),
                modeloProd: String.format(record.data.modeloProd),
                tipoProd: String.format(record.data.tipoProd),
                descripcionProd: String.format(record.data.descripcionProd),
                ubicacionProd: String.format(record.data.ubicacionProd),
                precioProd: String.format(record.data.precioProd),
                totalVent: String.format(record.data.precioProd),
                cantidadPVent: 1,
                existenciaProd: String.format(record.data.existenciaProd)
            });

            this.collapse();
        }
    };

    var setearCliente = function(record, index) {
        if (this.fireEvent('beforeselect', this, record, index) !== false) {

            new Ext.getCmp('formpanel2').getForm().setValues({
                nombreCli: String.format(record.data.nombreCli),
                apellidoCli: String.format(record.data.apellidoCli),
                idCLiente: String.format(record.data.idCLiente),
            });

            this.collapse();
        }
    };

    Ext.grid.RowSelectionModel.override({
        getSelectedIndex : function() {
            return this.grid.store.indexOf(this.selections.itemAt(0));
        }
    });

    Ext.grid.RowSelectionModel.override({
        getSelectedIndex : function() {
            return this.grid.store.indexOf(this.selections.itemAt(0));
        }
    });



    var producto = new Ext.data.Store({
        //id : 'producto',
        proxy : new Ext.data.HttpProxy({
            url : 'index.php?r=stores/verTplProd',
            baseParams:{opcion:'verTplProd'},
           // method : 'GET',
        }),
        reader : new Ext.data.JsonReader({
            root : 'data',
           // id : 'pk',
        }, [ {
            name : 'idProductos'
        }, {
            name : 'codigoProd'
        }, {
            name : 'nombreProd'
        }, {
            name : 'marcaProd'
        }, {
            name : 'modeloProd'
        },{
            name : 'tipoProd'
        },{
            name : 'ubicacionProd'
        },{
            name : 'existenciaProd'
        },{
            name : 'precioProd'
        },{
            name : 'descripcionProd'
        } 

        ])
    });



     var cliente = new Ext.data.Store({
        //id : 'cliente',
        proxy : new Ext.data.HttpProxy({
            url : 'index.php?r=stores/verTplCli',
            baseParams:{opcion:'verTplCli'},
            //method : 'GET',
        }),
        reader : new Ext.data.JsonReader({
            root : 'data',
           // id : 'pk',
        }, [ {
            name : 'idCLiente'
        }, {
            name : 'cedulaRifCli'
        }, {
            name : 'nombreCli'
        }, {
            name : 'apellidoCli'
        } 

        ])
    });


    var resultTpl = new Ext.XTemplate(
        '<tpl for=".">',
            '<div class="search-item">',
                '<b>{nombreProd}</b> - {marcaProd} {modeloProd}<br/>',
            '</div>',
        '</tpl>'
    );

    var resultCli = new Ext.XTemplate(
        '<tpl for=".">',
            '<div class="search-item">',
                '<b>{cedulaRifCli}</b> - {nombreCli} {apellidoCli}<br/>',
            '</div>',
        '</tpl>'
    );



    var reader = new Ext.data.JsonReader({
        idProperty: 'idProductos',
        fields: [
            
            {name: 'uno', type: 'int'},
            {name: 'idProductos', type: 'int'},
            {name: 'codigoVent', type: 'string'},
            {name: 'cantidadPVent', type: 'int'},
            {name: 'totalVent', type: 'string'},
            
        ]

    });

    // store vacio ya que no se usara
    var gridstore = new Ext.data.Store({
        url : '',
        reader : new Ext.data.JsonReader({
            root : [],
            fields : []
        }),

    });

    // declare the source Grid
    var grid = new Ext.grid.GridPanel({
        //store : gridstore,
        border : false,
        title: 'Lista de Articulos',
        stripeRows : true,
        width : '65%',
        region : 'west',


        ds: new Ext.data.GroupingStore({
            reader: reader,
            data: gridstore,
            groupField: 'uno'
        }),
        
        columns : [ {
            header : "uno",
            hidden : true,
            dataIndex : 'uno'
        }, {
            header : "idProductos",
            hidden : true,
            dataIndex : 'idProductos'
        }, {
            header : "Codigo",
            width : 120,
            dataIndex : 'codigoProd',
            
        }, {
            header : "Nombre",
            width : 200,
            dataIndex : 'nombreProd'
        }, {
            header : "Modelo",
            width : 200,
            dataIndex : 'modeloProd',
            summaryType: 'count',
            hideable: false,
            summaryRenderer: function(v, params, data){
                return ((v === 0 || v > 1) ? '' + v +' Productos' : '1 Producto');
            },
        }, {
            header : "Cantidad",
            width : 100,
            dataIndex : 'cantidadPVent'
        },

        {
            header : "Precio Unit",
            width : 150,
            dataIndex : 'precioProd',
        },



         {
            header : "Total",
            width : 150,
            dataIndex : 'totalVent',
            groupable: false,
            summaryType: 'sum',
            renderer : function(v){
                return 'Bs. '+v;
            },
            summaryRenderer: function(v, params, data){
                return 'Total Bs. '+v;
            },
                
        }


        ],

        view: new Ext.grid.GroupingView({
            forceFit: true,

        }),
        plugins: summary,

        tbar : [{
            text : 'Eliminar',
           // icon : './images/icons/cross_circle.png',
            handler : function() {
                var index = grid.getSelectionModel().getSelectedIndex();
                var rec = grid.store.getAt(index);
                grid.store.remove(rec);
            }
        }

        ],
    });

    // formulario
    var formPanel = new Ext.form.FormPanel({
        url : '.',
        region : 'center',
        id : 'formpanel',
        frame : true,
       // labelWidth : 100,
        border : false,
        width : '35%',
        items : [

        {
            xtype : 'combo',
            store : producto,
            //vtype : 'numero',
            minChars : 4,
            id : 'producto',
            displayField : 'nombreProd',
            fieldLabel : 'Producto',
            allowBlank : false,
            blankText : 'Debe ingresar el codigo o el nombre del producto!',
            typeAhead : false,
            loadingText : 'Buscando...',
            anchor : '90%',
            pageSize : 10,
            hideTrigger : true,
            tpl : resultTpl,
            itemSelector : 'div.search-item',
            onSelect : setearProducto,

        },{
            id : 'idProd',
            name: 'idProd',
            xtype : 'textfield',
            hidden: true
        },


         {
            id : 'codigoProd',
            fieldLabel: 'Codigo',
            name: 'codigoProd',
            xtype : 'textfield',
            readOnly: true,
        },{
            id : 'nombreProd',
            fieldLabel: 'Nombre',
            name: 'nombreProd',
            xtype : 'textfield',
            readOnly: true,
        },{
            id : 'modeloProd',
            fieldLabel: 'Modelo',
            name: 'modeloProd',
            xtype : 'textfield',
            readOnly: true,
        },{
            id : 'marcaProd',
            fieldLabel: 'Marca',
            name: 'marcaProd',
            xtype : 'textfield',
            readOnly: true,
        },{
            id : 'tipoProd',
            fieldLabel: 'Tipo',
            name: 'tipoProd',
            xtype : 'textfield',
            readOnly: true,
        },{
            id : 'ubicacionProd',
            fieldLabel: 'Ubicacion',
            name: 'ubicacionProd',
            xtype : 'textfield',
            readOnly: true,
        },{
                xtype: 'numberfield',
                fieldLabel: 'Cantidad',
                width: 160,
                name: 'cantidadPVent',
                id: 'cantidadPVent',
                listeners : {

                    specialkey: function(f,e){
                    if (e.getKey() == e.ENTER) {

                        var cantidadPVent = Ext.getCmp('cantidadPVent').getValue();
                        var precioProd = Ext.getCmp('precioProd').getValue();
                        var precio = precioProd*cantidadPVent;

                        new Ext.getCmp('formpanel').getForm().setValues({
                            totalVent: precio,
                        });

                               
                    }
                    }
                }
            },

            {
            id : 'precioProd',
            fieldLabel: 'Precio Unit',
            name: 'precioProd',
            xtype : 'textfield',
            readOnly: true,
        },


        {
            id : 'totalVent',
            fieldLabel: 'Total',
            name: 'totalVent',
            xtype : 'numberfield',
            readOnly: true,
        },


        

        {
            id : 'existenciaProd',
            fieldLabel: 'Existencia',
            name: 'existenciaProd',
            xtype : 'textfield',
            readOnly: true,
        },

        /// form 2
         {
            xtype : 'form',
            url : 'index.php?r=ventas/crear',
            region : 'center',
            id : 'formpanel2',
            frame : true,
            //labelWidth : 100,
            border : false,
            width : '35%',
            items : [ 

            {
                xtype : 'combo',
                store : cliente,
                //vtype : 'numero',
                minChars : 4,
                hidden: true,
                id : 'cliente',
                valueField: 'idCLiente',
               // hiddenName: 'idCLiente',
                displayField : 'cedulaRifCli',
                fieldLabel : 'Cedula',
                allowBlank : false,
                blankText : 'Debe ingresar la cedula o el nombre del cliente',
                typeAhead : false,
                loadingText : 'Buscando...',
                anchor : '90%',
                pageSize : 10,
                hideTrigger : true,
                tpl : resultCli,
                itemSelector : 'div.search-item',
                onSelect : setearCliente,

            },

             {   
                hidden : true,
                id : 'idCLiente',
                name: 'idCLiente',
                readOnly: true,
                xtype : 'textfield',
            },

            {   
                hidden : true,
                id : 'nombreCli',
                fieldLabel: 'Nombre',
                name: 'nombreCli',
                xtype : 'textfield',
                readOnly: true,
            },

            {   
                hidden : true,
                id : 'apellidoCli',
                fieldLabel: 'Apellido',
                name: 'apellidoCli',
                xtype : 'textfield',
                readOnly: true,
            }]
        }],
        fbar : [{
                    text : 'Agregar',
                    id : 'agregar',
                   // icon : './images/icons/tick_circle.png',
                    handler : function() {
                        
                        if (Ext.getCmp('producto').getValue() == '') {
                            Ext.Msg.alert('Error', 'Debe seleccionar un Producto');
                        } else {


                            

                            var u = new grid.store.recordType({

                                uno:1,
                                idProductos: Ext.getCmp('idProd').getValue(),
                                codigoProd: Ext.getCmp('codigoProd').getValue(),
                                cantidadPVent: Ext.getCmp('cantidadPVent').getValue(),
                                nombreProd: Ext.getCmp('nombreProd').getValue(),
                                modeloProd: Ext.getCmp('modeloProd').getValue(),
                                precioProd: Ext.getCmp('precioProd').getValue(),
                                totalVent: Ext.getCmp('totalVent').getValue(),
                                

                            });

                            grid.store.insert(0, u);
                            formPanel.form.reset();
                        }
                    }
                }, {
                    text : 'Limpiar',
                    id : 'limpiar',
                    handler : function() {
                        formPanel.form.reset();
                    }
                }

        ]
    });

    // Simple 'border layout' panel to house both grids
    var displayPanel = new Ext.Panel({
        width : '100%',
        height : 520,
        id : 'displayPanel',
        layout : 'border',
        renderTo : 'contenido',
        items : [ grid, formPanel ],
        bbar : [ {
            xtype : 'tbfill'
        }, {
            xtype : 'button',
           // icon: './images/icons/blog_more.gif',
            align : 'rigth',
            text : 'Siguiente......       ',
            id : 'siguiente',
            handler : step2,
        }, {
            xtype : 'button',
            hidden : true,
            text : 'Guardar',
            //icon: './images/icons/saved.png',
            id : 'save',
            handler : guardar,
        }

        ]
    });

});