<?php
/* @var $this MuncpController */
/* @var $data Muncp */
?>

<div class="view">

	
	<b><?php echo CHtml::encode($data->getAttributeLabel('Municipio')); ?>:</b>
	<?php echo CHtml::encode($data->nb_muncp); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('Ciudad')); ?>:</b>
	<?php echo CHtml::encode($data->idCiudad->nb_ciudad); ?>
	<br />


</div>