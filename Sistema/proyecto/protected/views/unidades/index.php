<?php
/* @var $this UnidadesController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Unidades',
);

$this->menu=array(
	array('label'=>'Crear Unidades', 'url'=>array('create')),
	array('label'=>'Gestionar Unidades', 'url'=>array('admin')),
);
?>

<h1>Unidades</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
