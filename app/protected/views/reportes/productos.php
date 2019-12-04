<?php
/* @var $this ReportesController */

$this->widget('ext.PdfGrid.EPDFGrid', array(
    'id'        => 'informe-pdf',
    'fileName'  => 'Lista de Productos',//Nombre del archivo generado sin la extension pdf (.pdf)
    'dataProvider'  => $dataProvider, //puede ser $model->search()
    'columns'   => array(
        'codigoProd',
        'nombreProd',
        'marcaProd',
        'modeloProd',
        'existenciaProd',
        'precioProd',
        /* array(
            'name'  => 'columnName4',
            'value' => '$data->relationName->value',
        ), */
    ),
    'config'    => array(
        'title'     => 'Lista de Productos',
        'subTitle'  => 'Al la fecha: '.date('Y-m-d'),
        'colWidths' => array(40, 40, 40, 40, 40, 40),
        'showLogo'  => true,
        'imagePath' => YiiBase::getPathOfAlias('webroot').'/images/logo2.png',
    ),
));
?>
