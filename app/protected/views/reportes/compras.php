<?php
/* @var $this ReportesController */

$this->widget('ext.PdfGrid.EPDFGrid', array(
    'id'        => 'informe-pdf',
    'fileName'  => 'Lista de Compras Realizadas',//Nombre del archivo generado sin la extension pdf (.pdf)
    'dataProvider'  => $dataProvider, //puede ser $model->search()
    'columns'   => array(
        'idProductos0.codigoProd',
        'idProductos0.nombreProd',
'unidadProd',
'fechaIngProd',
'costoProd',

	/* array(
            'name'  => 'columnName4',
            'value' => '$data->relationName->value',
        ), */
    ),
    'config'    => array(
        'title'     => 'Compras Realizadas',
        'subTitle'  => 'Al la fecha: '.date('Y-m-d'),
        'colWidths' => array(50, 50, 50, 50, 50),
        'showLogo'  => true,
        'imagePath' => YiiBase::getPathOfAlias('webroot').'/images/logo2.png',
    ),
));
?>
