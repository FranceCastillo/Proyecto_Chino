<?php
/* @var $this PersonalController */
/* @var $model Personal */

$this->breadcrumbs=array(
	'Personals'=>array('index'),
	$model->id_personal=>array('view','id'=>$model->id_personal),
	'Modificar',
);

$this->menu=array(
	array('label'=>'Listar Personal', 'url'=>array('index')),
	array('label'=>'Crear Personal', 'url'=>array('create')),
	array('label'=>'Ver Personal', 'url'=>array('view', 'id'=>$model->id_personal)),
	array('label'=>'Gestionar Personal', 'url'=>array('admin')),
);
?>

<h1>Personal Militar <?php echo $model->nu_docm_idnt; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>