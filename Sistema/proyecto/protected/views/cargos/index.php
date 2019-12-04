<?php
/* @var $this CargosController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Cargos',
);

$this->menu=array(
	array('label'=>'Crear Cargos', 'url'=>array('create')),
	array('label'=>'Gestionar Cargos', 'url'=>array('admin')),
);
?>

<h1>Cargos</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
