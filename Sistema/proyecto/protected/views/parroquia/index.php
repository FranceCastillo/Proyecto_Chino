<?php
/* @var $this ParroquiaController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Parroquias',
);

$this->menu=array(
	array('label'=>'Create Parroquia', 'url'=>array('create')),
	array('label'=>'Manage Parroquia', 'url'=>array('admin')),
);
?>

<h1>Parroquias</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
