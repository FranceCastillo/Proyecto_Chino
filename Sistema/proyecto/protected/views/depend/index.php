<?php
/* @var $this DependController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Depends',
);

$this->menu=array(
	array('label'=>'Crear Dependendencia', 'url'=>array('create')),
	array('label'=>'Gestionar Dependendencia', 'url'=>array('admin')),
);
?>

<h1>Dependencias</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
