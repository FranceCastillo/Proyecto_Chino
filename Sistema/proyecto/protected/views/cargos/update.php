<?php
/* @var $this CargosController */
/* @var $model Cargos */

$this->breadcrumbs=array(
	'Cargos'=>array('index'),
	$model->id_cargos=>array('view','id'=>$model->id_cargos),
	'Modificar',
);

$this->menu=array(
	array('label'=>'Listar Cargos', 'url'=>array('index')),
	array('label'=>'Crear Cargos', 'url'=>array('create')),
	array('label'=>'Ver Cargos', 'url'=>array('view', 'id'=>$model->id_cargos)),
	array('label'=>'Gestionar Cargos', 'url'=>array('admin')),
);
?>

<h1>Modificar Cargo <?php echo $model->id_cargos; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>