<?php
/* @var $this TipoUnidadController */
/* @var $model TipoUnidad */

$this->breadcrumbs=array(
	'Tipo Unidads'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List TipoUnidad', 'url'=>array('index')),
	array('label'=>'Manage TipoUnidad', 'url'=>array('admin')),
);
?>

<h1>Create TipoUnidad</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>