<?php
/* @var $this GradosController */
/* @var $model Grados */

$this->breadcrumbs=array(
	'Gradoses'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Grados', 'url'=>array('index')),
	array('label'=>'Manage Grados', 'url'=>array('admin')),
);
?>

<h1>Create Grados</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>