<?php
/* @var $this CiudadController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Ciudads',
);

$this->menu=array(
	array('label'=>'Crear Ciudad', 'url'=>array('create')),
	array('label'=>'Gestionar Ciudad', 'url'=>array('admin')),
);
?>

<h1>Ciudades</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
