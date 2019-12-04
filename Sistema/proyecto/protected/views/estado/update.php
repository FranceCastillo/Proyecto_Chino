<?php
/* @var $this EstadoController */
/* @var $model Estado */

$this->breadcrumbs=array(
	'Estados'=>array('index'),
	$model->id_edo=>array('view','id'=>$model->id_edo),
	'Update',
);

$this->menu=array(
	array('label'=>'List Estado', 'url'=>array('index')),
	array('label'=>'Create Estado', 'url'=>array('create')),
	array('label'=>'View Estado', 'url'=>array('view', 'id'=>$model->id_edo)),
	array('label'=>'Manage Estado', 'url'=>array('admin')),
);
?>

<h1>Update Estado <?php echo $model->id_edo; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>