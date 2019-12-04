<?php
/* @var $this MuncpController */
/* @var $model Muncp */

$this->breadcrumbs=array(
	'Muncps'=>array('index'),
	$model->id_muncp=>array('view','id'=>$model->id_muncp),
	'Update',
);

$this->menu=array(
	array('label'=>'List Muncp', 'url'=>array('index')),
	array('label'=>'Create Muncp', 'url'=>array('create')),
	array('label'=>'View Muncp', 'url'=>array('view', 'id'=>$model->id_muncp)),
	array('label'=>'Manage Muncp', 'url'=>array('admin')),
);
?>

<h1>Update Muncp <?php echo $model->id_muncp; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>