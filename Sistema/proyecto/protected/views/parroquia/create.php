<?php
/* @var $this ParroquiaController */
/* @var $model Parroquia */

$this->breadcrumbs=array(
	'Parroquias'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Parroquia', 'url'=>array('index')),
	array('label'=>'Manage Parroquia', 'url'=>array('admin')),
);
?>

<h1>Create Parroquia</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>