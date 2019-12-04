<?php
/* @var $this GradosController */
/* @var $model Grados */

$this->breadcrumbs=array(
	'Gradoses'=>array('index'),
	$model->id_grados,
);

$this->menu=array(
	array('label'=>'List Grados', 'url'=>array('index')),
	array('label'=>'Create Grados', 'url'=>array('create')),
	array('label'=>'Update Grados', 'url'=>array('update', 'id'=>$model->id_grados)),
	array('label'=>'Delete Grados', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id_grados),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Grados', 'url'=>array('admin')),
);
?>

<h1>View Grados #<?php echo $model->id_grados; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id_grados',
		'nb_grados',
	),
)); ?>
