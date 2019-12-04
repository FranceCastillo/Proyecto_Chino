<?php
/* @var $this MuncpController */
/* @var $model Muncp */

$this->breadcrumbs=array(
	'Muncps'=>array('index'),
	$model->id_muncp,
);

$this->menu=array(
	array('label'=>'List Muncp', 'url'=>array('index')),
	array('label'=>'Create Muncp', 'url'=>array('create')),
	array('label'=>'Update Muncp', 'url'=>array('update', 'id'=>$model->id_muncp)),
	array('label'=>'Delete Muncp', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id_muncp),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Muncp', 'url'=>array('admin')),
);
?>

<h1>View Muncp #<?php echo $model->id_muncp; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id_muncp',
		'nb_muncp',
		'id_ciudad',
	),
)); ?>
