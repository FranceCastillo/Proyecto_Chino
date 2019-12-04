<?php
/* @var $this UnidadesController */
/* @var $model Unidades */

$this->breadcrumbs=array(
	'Unidades'=>array('index'),
	'Crear',
);

$this->menu=array(
	array('label'=>'Listar Unidades', 'url'=>array('index')),
	array('label'=>'Gestionar Unidades', 'url'=>array('admin')),
);
?>

<h1>Crear Unidad</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>