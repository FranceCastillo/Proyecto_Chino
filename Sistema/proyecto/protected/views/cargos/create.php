<?php
/* @var $this CargosController */
/* @var $model Cargos */

$this->breadcrumbs=array(
	'Cargos'=>array('index'),
	'Crear',
);

$this->menu=array(
	array('label'=>'Listar Cargos', 'url'=>array('index')),
	array('label'=>'Gestionar Cargos', 'url'=>array('admin')),
);
?>

<h1>Crear Cargos</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>