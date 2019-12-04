<?php
/* @var $this DependController */
/* @var $model Depend */

$this->breadcrumbs=array(
	'Depends'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Depend', 'url'=>array('index')),
	array('label'=>'Manage Depend', 'url'=>array('admin')),
);
?>

<h1>Create Depend</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>