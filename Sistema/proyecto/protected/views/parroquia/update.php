<?php
/* @var $this ParroquiaController */
/* @var $model Parroquia */

$this->breadcrumbs=array(
	'Parroquias'=>array('index'),
	$model->id_prrq=>array('view','id'=>$model->id_prrq),
	'Update',
);

$this->menu=array(
	array('label'=>'List Parroquia', 'url'=>array('index')),
	array('label'=>'Create Parroquia', 'url'=>array('create')),
	array('label'=>'View Parroquia', 'url'=>array('view', 'id'=>$model->id_prrq)),
	array('label'=>'Manage Parroquia', 'url'=>array('admin')),
);
?>

<h1>Update Parroquia <?php echo $model->id_prrq; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>