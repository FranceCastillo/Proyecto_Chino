<?php
/* @var $this ParroquiaController */
/* @var $model Parroquia */

$this->breadcrumbs=array(
	'Parroquias'=>array('index'),
	$model->id_prrq,
);

$this->menu=array(
	array('label'=>'List Parroquia', 'url'=>array('index')),
	array('label'=>'Create Parroquia', 'url'=>array('create')),
	array('label'=>'Update Parroquia', 'url'=>array('update', 'id'=>$model->id_prrq)),
	array('label'=>'Delete Parroquia', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id_prrq),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Parroquia', 'url'=>array('admin')),
);
?>

<h1>View Parroquia #<?php echo $model->id_prrq; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id_prrq',
		'nb_prrq',
		'id_muncp',
	),
)); ?>
