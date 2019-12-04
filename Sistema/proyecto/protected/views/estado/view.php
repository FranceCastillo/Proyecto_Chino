<?php
/* @var $this EstadoController */
/* @var $model Estado */

$this->breadcrumbs=array(
	'Estados'=>array('index'),
	$model->id_edo,
);

$this->menu=array(
	array('label'=>'List Estado', 'url'=>array('index')),
	array('label'=>'Create Estado', 'url'=>array('create')),
	array('label'=>'Update Estado', 'url'=>array('update', 'id'=>$model->id_edo)),
	array('label'=>'Delete Estado', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id_edo),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Estado', 'url'=>array('admin')),
);
?>

<h1>View Estado #<?php echo $model->id_edo; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id_edo',
		'nb_edo',
	),
)); ?>
