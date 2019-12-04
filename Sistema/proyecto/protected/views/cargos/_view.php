<?php
/* @var $this CargosController */
/* @var $data Cargos */
?>

<div class="view">

	<?php /*<b><?php echo CHtml::encode($data->getAttributeLabel('id_cargos')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id_cargos), array('view', 'id'=>$data->id_cargos)); ?>
	<br />*/?>

	<b><?php echo CHtml::encode($data->getAttributeLabel('Cargo')); ?>:</b>
	<?php echo CHtml::encode($data->nb_cargos); ?>
	<br />


</div>