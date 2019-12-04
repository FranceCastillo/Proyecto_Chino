<?php
/* @var $this ReportesController */

$this->widget('ext.PdfGrid.EPDFGrid', array(
    'id'        => 'informe-pdf',
    'fileName'  => 'Lista de Proveedores',//Nombre del archivo generado sin la extension pdf (.pdf)
    'dataProvider'  => $dataProvider, //puede ser $model->search()
    'columns'   => array(
'rifProv',
'nombreProv',
'fechaIngProv',
'descripcionProv',
'telefonoProv',
'correoProv',
	/* array(
            'name'  => 'columnName4',
            'value' => '$data->relationName->value',
        ), */
    ),
    'config'    => array(
        'title'     => 'Lista de Proveedores',
        'subTitle'  => 'Al la fecha: '.date('Y-m-d'),
        'colWidths' => array(30, 40, 30, 60, 40, 50),
        'showLogo'  => true,
        'imagePath' => YiiBase::getPathOfAlias('webroot').'/images/logo2.png',
    ),
));
?>
