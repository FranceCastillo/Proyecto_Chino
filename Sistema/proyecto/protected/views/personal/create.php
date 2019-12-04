<?php
/* @var $this PersonalController */
/* @var $model Personal */

$this->breadcrumbs=array(
	'Personal'=>array('index'),
	'Crear',
);

$this->menu=array(
	array('label'=>'Listar Personal', 'url'=>array('index')),
	array('label'=>'Gestionar Personal', 'url'=>array('admin')),
);
?>

<h1>Create Personal</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>