<?php
/* @var $this UnidadesController */
/* @var $model Unidades */

$this->breadcrumbs=array(
	'Unidades'=>array('index'),
	$model->id_unid=>array('view','id'=>$model->id_unid),
	'Modificar',
);

$this->menu=array(
	array('label'=>'Listar Unidades', 'url'=>array('index')),
	array('label'=>'Crear Unidades', 'url'=>array('create')),
	array('label'=>'Ver Unidades', 'url'=>array('view', 'id'=>$model->id_unid)),
	array('label'=>'Gestionar Unidades', 'url'=>array('admin')),
);
?>

<h1>Modificar Unidad <?php echo $model->nb_unid; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>