<?php
/* @var $this ReportesController */

$this->widget('ext.PdfGrid.EPDFGrid', array(
    'id'        => 'informe-pdf',
    'fileName'  => 'Lista de Clientes',//Nombre del archivo generado sin la extension pdf (.pdf)
    'dataProvider'  => $dataProvider, //puede ser $model->search()
    'columns'   => array(

'cedulaRifCli',
'nombreCli',
'apellidoCli',
'telefonoCli',
'correoCli'

        /* array(
            'name'  => 'columnName4',
            'value' => '$data->relationName->value',
        ), */
    ),
    'config'    => array(
        'title'     => 'Lista de Clientes',
        'subTitle'  => 'Al la fecha: '.date('Y-m-d'),
        'colWidths' => array(50, 50, 50, 50, 50),
        'showLogo'  => true,
        'imagePath' => YiiBase::getPathOfAlias('webroot').'/images/logo2.png',
    ),
));
?>
