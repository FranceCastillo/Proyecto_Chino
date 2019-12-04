<?php
/* @var $this UnidadesController */
/* @var $model Unidades */

$this->breadcrumbs=array(
	'Unidades'=>array('index'),
	'Gestionar',
);

$this->menu=array(
	array('label'=>'Listar Unidades', 'url'=>array('index')),
	array('label'=>'Crear Unidades', 'url'=>array('create')),
	array('label'=>'Exportar a PDF', 'url'=>array('pdf')), 
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#unidades-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Unidades</h1>

<p>
También puede escribir un operador de comparación (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
o <b>=</b>) al principio de cada uno de los valores de búsqueda para especificar cómo se debe hacer la comparación.
</p>

<?php echo CHtml::link('Advanced Search','#',array('class'=>'search-button')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'unidades-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
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
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
