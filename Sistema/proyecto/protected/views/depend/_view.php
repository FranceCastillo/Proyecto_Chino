<?php
/* @var $this DependController */
/* @var $data Depend */
?>

<div class="view">

	<?php /*<b><?php echo CHtml::encode($data->getAttributeLabel('id_dep')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id_dep), array('view', 'id'=>$data->id_dep)); ?>
	<br />*/?>

	<b><?php echo CHtml::encode($data->getAttributeLabel('nb_dep')); ?>:</b>
	<?php echo CHtml::encode($data->nb_dep); ?>
	<br />


</div>