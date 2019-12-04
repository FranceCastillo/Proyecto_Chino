<?php
/* @var $this PersonalController */
/* @var $model Personal */

$this->breadcrumbs=array(
	'Personal'=>array('index'),
	'Gestionar',
);

$this->menu=array(
	array('label'=>'Listar Personal', 'url'=>array('index')),
	array('label'=>'Crear Personal', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#personal-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>
<h1>Personal Militar</h1>

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
	'id'=>'personal-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'nu_docm_idnt',
		'nombre',
		'apellido',
		'nu_tlf_local',
		'nu_tlf_cel',
		array(
		                    'header'=>'Unidad',
		                    'name'=>'unidad',
		                    'value' => '$data->unidad0->nb_unid',
		                    'htmlOptions'=>array('style'=>'text-align: center','width'=>'80px'),
		                    'filter' => CHtml::listData(Unidades::model()->findAll(), 'id_unid', 'nb_unid')
		              ),
		array(
		                    'header'=>'Cargo',
		                    'name'=>'id_cargo',
		                    'value' => '$data->idCargo->nb_cargos',
		                    'htmlOptions'=>array('style'=>'text-align: center','width'=>'80px'),
		                    'filter' => CHtml::listData(Cargos::model()->findAll(), 'id_cargos', 'nb_cargos')
		              ),
		array(
		                    'header'=>'Grado',
		                    'name'=>'id_grado',
		                    'value' => '$data->idGrado->nb_grados',
		                    'htmlOptions'=>array('style'=>'text-align: center','width'=>'80px'),
		                    'filter' => CHtml::listData(Grados::model()->findAll(), 'id_grados', 'nb_grados')
		              ),

		/*
		'email',
		'sexo',
		*/
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
