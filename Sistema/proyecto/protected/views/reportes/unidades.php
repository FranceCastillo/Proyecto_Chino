<?php
/* @var $this ReportesController */

$this->widget('ext.PdfGrid.EPDFGrid', array(
    'id'        => 'informe-pdf',
    'fileName'  => 'Lista de Unidades',//Nombre del archivo generado sin la extension pdf (.pdf)
    'dataProvider'  => $dataProvider, //puede ser $model->search()
    'columns'=>array(
        'nb_unid',
        'coor_unid',
        array(
                            'header'=>'Parroquia',
                            'name'=>'id_prrq',
                            'value' => '$data->idPrrq->nb_prrq',
                            'htmlOptions'=>array('style'=>'text-align: center','width'=>'80px'),
                            'filter' => CHtml::listData(Parroquia::model()->findAll(), 'id_prrq', 'nb_prrq')
                      ),

        'persona_encarg',

        array(
                            'header'=>'Tipo de Unidad',
                            'name'=>'tipo_unid',
                            'value' => '$data->tipoUn->nb_tipo',
                            'htmlOptions'=>array('style'=>'text-align: center','width'=>'80px'),
                            'filter' => CHtml::listData(TipoUnidad::model()->findAll(), 'id_tipo_unidad', 'nb_tipo')
                      ),
        /* array(
            'name'  => 'columnName4',
            'value' => '$data->relationName->value',
        ), */
    ),
    'config'    => array(
        'title'     => 'Lista de Unidades',
        'subTitle'  => 'Al la fecha: '.date('Y-m-d'),
        'colWidths' => array(50, 50, 50, 50, 50),
        'showLogo'  => true,
        'imagePath' => YiiBase::getPathOfAlias('webroot').'/images/logoo.png',
    ),
));
?>
