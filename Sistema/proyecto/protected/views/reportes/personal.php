<?php
/* @var $this ReportesController */

$this->widget('ext.PdfGrid.EPDFGrid', array(
    'id'        => 'informe-pdf',
    'fileName'  => 'Lista de Personal',//Nombre del archivo generado sin la extension pdf (.pdf)
    'dataProvider'  => $dataProvider, //puede ser $model->search()
    'columns'   => array(
        'nu_docm_idnt',
        'nombre',
        'apellido',
        'nu_tlf_local',
        'nu_tlf_cel',
        array(
                            'header'=>'Unidad',
                            'name'=>'unidad',
                            'value' => '$data->unidad0->nb_unid',
                            'filter' => CHtml::listData(Unidades::model()->findAll(), 'id_unid', 'nb_unid')
                      ),
        
	/* array(
            'name'  => 'columnName4',
            'value' => '$data->relationName->value',
        ), */
    ),
    'config'    => array(
        'title'     => 'Lista de Personal',
        'colWidths' => array(40, 40, 30, 60, 40, 50),
        'showLogo'  => true,
        'imagePath' => YiiBase::getPathOfAlias('webroot').'/images/logoo.png',
    ),
));
?>
