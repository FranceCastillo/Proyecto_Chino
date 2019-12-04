<?php
/* @var $this GradosController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Gradoses',
);

$this->menu=array(
	array('label'=>'Crear Grados', 'url'=>array('create')),
	array('label'=>'Gestionar Grados', 'url'=>array('admin')),
);
?>

<h1>Grados</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
