<?php
/* @var $this CiudadController */
/* @var $model Ciudad */

$this->breadcrumbs=array(
	'Ciudads'=>array('index'),
	$model->id_ciudad=>array('view','id'=>$model->id_ciudad),
	'Update',
);

$this->menu=array(
	array('label'=>'List Ciudad', 'url'=>array('index')),
	array('label'=>'Create Ciudad', 'url'=>array('create')),
	array('label'=>'View Ciudad', 'url'=>array('view', 'id'=>$model->id_ciudad)),
	array('label'=>'Manage Ciudad', 'url'=>array('admin')),
);
?>

<h1>Update Ciudad <?php echo $model->id_ciudad; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>