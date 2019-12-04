<?php
/* @var $this MuncpController */
/* @var $model Muncp */

$this->breadcrumbs=array(
	'Muncps'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Muncp', 'url'=>array('index')),
	array('label'=>'Manage Muncp', 'url'=>array('admin')),
);
?>

<h1>Create Muncp</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>