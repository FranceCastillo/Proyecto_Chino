<?php
/* @var $this ParroquiaController */
/* @var $data Parroquia */
?>

<div class="view">

	
	<b><?php echo CHtml::encode($data->getAttributeLabel('Parroquia')); ?>:</b>
	<?php echo CHtml::encode($data->nb_prrq); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('Municipio')); ?>:</b>
	<?php echo CHtml::encode($data->idMuncp->nb_muncp); ?>
	<br />


</div>