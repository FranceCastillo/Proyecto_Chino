<?php
/* @var $this GradosController */
/* @var $model Grados */

$this->breadcrumbs=array(
	'Gradoses'=>array('index'),
	$model->id_grados=>array('view','id'=>$model->id_grados),
	'Update',
);

$this->menu=array(
	array('label'=>'List Grados', 'url'=>array('index')),
	array('label'=>'Create Grados', 'url'=>array('create')),
	array('label'=>'View Grados', 'url'=>array('view', 'id'=>$model->id_grados)),
	array('label'=>'Manage Grados', 'url'=>array('admin')),
);
?>

<h1>Update Grados <?php echo $model->id_grados; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>