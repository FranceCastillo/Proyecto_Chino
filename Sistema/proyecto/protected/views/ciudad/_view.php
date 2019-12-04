<?php
/* @var $this CiudadController */
/* @var $data Ciudad */
?>

<div class="view">


	<b><?php echo CHtml::encode($data->getAttributeLabel('Ciudad')); ?>:</b>
	<?php echo CHtml::encode($data->nb_ciudad); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('Estados')); ?>:</b>
	<?php echo CHtml::encode($data->idEdo->nb_edo); ?>
	<br />


</div>