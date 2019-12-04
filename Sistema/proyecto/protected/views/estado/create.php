<?php
/* @var $this EstadoController */
/* @var $model Estado */

$this->breadcrumbs=array(
	'Estados'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Estado', 'url'=>array('index')),
	array('label'=>'Manage Estado', 'url'=>array('admin')),
);
?>

<h1>Create Estado</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>