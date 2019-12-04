<?php
/* @var $this TipoUnidadController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Tipo Unidads',
);

$this->menu=array(
	array('label'=>'Crear Tipo', 'url'=>array('create')),
	array('label'=>'Gestionar Tipo', 'url'=>array('admin')),
);
?>

<h1>Tipo Unidades</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
