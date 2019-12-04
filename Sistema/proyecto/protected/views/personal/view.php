<?php
/* @var $this PersonalController */
/* @var $model Personal */

$this->breadcrumbs=array(
	'Personal'=>array('index'),
	$model->nu_docm_idnt,
);

$this->menu=array(
	array('label'=>'Listar Personal', 'url'=>array('index')),
	array('label'=>'Crear Personal', 'url'=>array('create')),
	array('label'=>'Modificar Personal', 'url'=>array('update', 'id'=>$model->id_personal)),
	array('label'=>'Eliminar Personal', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id_personal),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Gestionar Personal', 'url'=>array('admin')),
);
?>

<h1>Ver Personal #<?php echo $model->nu_docm_idnt; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'nu_docm_idnt',
		'username',
		'nombre',
		'apellido',
		'sexo',
		'email',
		'nu_tlf_local',
		'nu_tlf_cel',
		'idDepen.nb_dep',
		'idCargo.nb_cargos',
		'idGrado.nb_grados',
		'unidad0.nb_unid',
	),
)); ?>
