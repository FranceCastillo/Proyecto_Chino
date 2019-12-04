<?php
/* @var $this TipoUnidadController */
/* @var $model TipoUnidad */

$this->breadcrumbs=array(
	'Tipo Unidads'=>array('index'),
	$model->id_tipo_unidad=>array('view','id'=>$model->id_tipo_unidad),
	'Update',
);

$this->menu=array(
	array('label'=>'List TipoUnidad', 'url'=>array('index')),
	array('label'=>'Create TipoUnidad', 'url'=>array('create')),
	array('label'=>'View TipoUnidad', 'url'=>array('view', 'id'=>$model->id_tipo_unidad)),
	array('label'=>'Manage TipoUnidad', 'url'=>array('admin')),
);
?>

<h1>Update TipoUnidad <?php echo $model->id_tipo_unidad; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>