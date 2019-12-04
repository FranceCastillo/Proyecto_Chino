
                    <div class="span12">
                        <div>
                                <header>
                                    <h2><span></span> Estadisticas</h2>
                                </header>

                                <script src="<?php echo Yii::app()->request->baseUrl; ?>/js/highcharts.js"></script>
                                <script src="<?php echo Yii::app()->request->baseUrl; ?>/js/exporting.js"></script>
                                <script src="<?php echo Yii::app()->request->baseUrl; ?>/js/gray.js"></script>
                                
                                <script>

                                Ext.onReady(function(){
                                Ext.QuickTips.init();

                                var simple = new Ext.FormPanel({
                                    renderTo: 'contenido',
                                    labelWidth: 110,
                                    frame: false,
                                    border: false,
                                    width: '100%',
                                    bodyStyle: 'background: transparent;',
                                    items: [

                                            {
                                                columnWidth:.3,
                                                layout: 'column',
                                                bodyStyle: 'background: transparent;',
                                                items: [{       
                                                       name: 'fechaD',
                                                       width: 130,
                                                       id: 'fechaD',
                                                       xtype: 'datefield',
                                                       format: 'Y-m-d',
                                                       blankText: 'Desde...',
                                                       allowBlank: false
                                                },{       
                                                       name: 'fechaH',
                                                       width: 130,
                                                       id: 'fechaH',
                                                       xtype: 'datefield',
                                                       format: 'Y-m-d',
                                                       blankText: 'Hasta...',
                                                       allowBlank: false
                                                },
                                                 {
   
                                                         xtype: 'combo',
                                                         mode: 'local',
                                                         id: 'tipo',
                                                         width: 200,
                                                         editable: false,
                                                         triggerAction: 'all',
                                                         displayField: 'name',
                                                         valueField: 'value',
                                                         allowBlank: false,
                                                         store : new Ext.data.JsonStore({
                                                            fields: ['name', 'value' ],
                                                            data: [
                                                                {name: 'Producto mas vendidos', value: 'pie'}, 
                                                                {name: 'Calidad de Productos', value: 'pie1'}, 
                                                                {name: 'Ventas al mes - linea', value: 'linea'},
                                                                {name: 'ventas al mes - barra', value: 'barra'}
                                                            ]
                                                        })
                                                  },

                                                {   xtype: 'button',
                                                    text: 'Ver',
                                                    handler: function(){
                                                        if (simple.getForm().isValid()) {
                                                            var fechaD= Ext.getCmp('fechaD').value; 
                                                            var fechaH= Ext.getCmp('fechaH').value; 
                                                            var tipo= Ext.getCmp('tipo').value; 
                                                            grafico(fechaD, fechaH, tipo);
                                                        }
                                                    }
                                                }]
                                            }
                                    ]
                                    });

                                });


                                </script>

                                <div id="contenido"></div>
                                
                                <br/><br/>
                                <div id="grafico"></div>

                               


                        </div>
                    </div>

                <script>

function grafico(fechaD, fechaH, tipo){

if (tipo == "pie1"){


$.getJSON("index.php?r=estadisticas/verTortaCalidad", function(json) {

    chart = new Highcharts.Chart({
      chart: {
        renderTo: 'grafico',
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false
      },
      

      title: {
        text: 'Calidad de Productos'
      },

      legend: {
                align: 'right',
                x: -100,
                verticalAlign: 'top',
                y: 20,
                floating: true,
                backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColorSolid) || 'white',
                borderColor: '#CCC',
                borderWidth: 1,
                shadow: false
            },


      tooltip: {
        formatter: function() {
          return '<b>'+ this.point.name+'</b>: '+ this.y;
        }
      },
      
      plotOptions: {
        pie: {
          allowPointSelect: true,
          cursor: 'pointer',
          dataLabels: {
            enabled: true,
            formatter: function() {
              return '<b>'+ this.point.name+'</b>: '+ this.y;
            }
          },
          showInLegend: true
        },
      },
      
      series: [{
        type: 'pie',
        name: 'Productos',
        data: json
      }]

    });


  });
} 
else if (tipo == "pie"){


$.getJSON("index.php?r=estadisticas/verTorta&fechaD="+fechaD+"&fechaH="+fechaH, function(json) {

    chart = new Highcharts.Chart({
      chart: {
        renderTo: 'grafico',
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false
      },
      

      title: {
        text: 'Producto mas vendido'
      },

      legend: {
                align: 'right',
                x: -100,
                verticalAlign: 'top',
                y: 20,
                floating: true,
                backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColorSolid) || 'white',
                borderColor: '#CCC',
                borderWidth: 1,
                shadow: false
            },


      tooltip: {
        formatter: function() {
          return '<b>'+ this.point.name+'</b>: '+ this.y;
        }
      },
      
      plotOptions: {
        pie: {
          allowPointSelect: true,
          cursor: 'pointer',
          dataLabels: {
            enabled: true,
            formatter: function() {
              return '<b>'+ this.point.name+'</b>: '+ this.y;
            }
          },
          showInLegend: true
        },
      },
      
      series: [{
        type: 'pie',
        name: 'Productos',
        data: json
      }]

    });


  });

}else if(tipo== "linea"){


  $.getJSON("index.php?r=estadisticas/verLinea&fechaD="+fechaD+"&fechaH="+fechaH, function(json) {



    chart = new Highcharts.Chart({
            chart: {
                renderTo: 'grafico',
                type: 'line',
            },
            title: {
                text: 'Promedio de Ventas',
            },
            xAxis: {
                categories: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                labels: {
                    rotation: -45,
                    align: 'right',
                   
                }
            },
            yAxis: {
                min: 0,
                allowDecimals: false,
                title: {
                    text: 'Ventas'
                },
                
            },

            legend: {
                align: 'right',
                x: -100,
                verticalAlign: 'top',
                y: 20,
                floating: true,
                backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColorSolid) || 'white',
                borderColor: '#CCC',
                borderWidth: 1,
                shadow: false
            },


            tooltip: {
                formatter: function() {
                        return 'En '+ this.x + ': <br/><b>'+ this.y +' '+ this.series.name +'</b>';
                }
            },

            
            series: json
        });
  
  
  
  });



}else if(tipo == "barra"){



$.getJSON("index.php?r=estadisticas/verLinea&fechaD="+fechaD+"&fechaH="+fechaH, function(json) {

chart = new Highcharts.Chart({
            chart: {
                renderTo: 'grafico',
                type: 'column'
            },

            title: {
                text: 'Promedio de Ventas',
            },
            xAxis: {
                categories: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                labels: {
                    rotation: -45,
                    align: 'right',
                   
                }
            },
            yAxis: {
                min: 0,
                allowDecimals: false,
                title: {
                    text: 'Ventas'
                },
                stackLabels: {
                    enabled: true,
                    style: {
                        fontWeight: 'bold',
                        color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                    }
                }
                
            },


            legend: {
                align: 'right',
                x: -100,
                verticalAlign: 'top',
                y: 20,
                floating: true,
                backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColorSolid) || 'white',
                borderColor: '#CCC',
                borderWidth: 1,
                shadow: false
            },
            plotOptions: {
                column: {
                    stacking: 'normal',
                    dataLabels: {
                        enabled: true,
                        color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
                    }
                }
            },

            series: json
        });
    });

  }

}
 


</script>

