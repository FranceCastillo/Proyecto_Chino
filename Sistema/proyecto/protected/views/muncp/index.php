<?php
/* @var $this MuncpController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Muncps',
);

$this->menu=array(
	array('label'=>'Crear Municipios', 'url'=>array('create')),
	array('label'=>'Manage Municipios', 'url'=>array('admin')),
);
?>

<h1>Municipios</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
