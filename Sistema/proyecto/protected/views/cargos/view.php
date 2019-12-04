<?php
/* @var $this CargosController */
/* @var $model Cargos */

$this->breadcrumbs=array(
	'Cargoses'=>array('index'),
	$model->id_cargos,
);

$this->menu=array(
	array('label'=>'List Cargos', 'url'=>array('index')),
	array('label'=>'Create Cargos', 'url'=>array('create')),
	array('label'=>'Update Cargos', 'url'=>array('update', 'id'=>$model->id_cargos)),
	array('label'=>'Delete Cargos', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id_cargos),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Cargos', 'url'=>array('admin')),
);
?>

<h1>View Cargos #<?php echo $model->id_cargos; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id_cargos',
		'nb_cargos',
	),
)); ?>
