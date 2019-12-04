<?php
/* @var $this TipoUnidadController */
/* @var $model TipoUnidad */

$this->breadcrumbs=array(
	'Tipo Unidads'=>array('index'),
	$model->id_tipo_unidad,
);

$this->menu=array(
	array('label'=>'List TipoUnidad', 'url'=>array('index')),
	array('label'=>'Create TipoUnidad', 'url'=>array('create')),
	array('label'=>'Update TipoUnidad', 'url'=>array('update', 'id'=>$model->id_tipo_unidad)),
	array('label'=>'Delete TipoUnidad', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id_tipo_unidad),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage TipoUnidad', 'url'=>array('admin')),
);
?>

<h1>View TipoUnidad #<?php echo $model->id_tipo_unidad; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id_tipo_unidad',
		'nb_tipo',
	),
)); ?>
