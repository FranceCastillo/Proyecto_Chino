<?php
/* @var $this ReportesController */

$this->widget('ext.PdfGrid.EPDFGrid', array(
    'id'        => 'informe-pdf',
    'fileName'  => 'Lista de ventas',//Nombre del archivo generado sin la extension pdf (.pdf)
    'dataProvider'  => $dataProvider, //puede ser $model->search()
    'columns'   => array(
'idCliente0.cedulaRifCli',
'idCliente0.nombreCli',
'idCliente0.apellidoCli',
'idProductos0.codigoProd',
'codigoVent',
'cantidadPVent',
'fechaVent',
'totalVent',        
        /* array(
            'name'  => 'columnName4',
            'value' => '$data->relationName->value',
        ), */
    ),
    'config'    => array(
        'title'     => 'Lista de Productos',
        'subTitle' => ' Lista de ventas: '.date('Y-m-d'),
        'colWidths' => array(30, 30, 30, 40, 30, 40, 30, 40),
        'showLogo'  => true,
        'imagePath' => YiiBase::getPathOfAlias('webroot').'/images/logo2.png',
    ),
));
?>
