<?php
/* @var $this PersonalController */
/* @var $data Personal */
?>

<div class="view">

	
	<b><?php echo CHtml::encode($data->getAttributeLabel('nu_docm_idnt')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->nu_docm_idnt), array('view', 'id'=>$data->id_personal)); ?>
	<br />
	

	<b><?php echo CHtml::encode($data->getAttributeLabel('username')); ?>:</b>
	<?php echo CHtml::encode($data->username); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nombre')); ?>:</b>
	<?php echo CHtml::encode($data->nombre); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('apellido')); ?>:</b>
	<?php echo CHtml::encode($data->apellido); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('sexo')); ?>:</b>
	<?php echo CHtml::encode($data->sexo); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('email')); ?>:</b>
	<?php echo CHtml::encode($data->email); ?>
	<br />


	<b><?php echo CHtml::encode($data->getAttributeLabel('unidad')); ?>:</b>
	<?php echo CHtml::encode($data->unidad0->nb_unid); ?>
	<br />
	

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('nu_tlf_local')); ?>:</b>
	<?php echo CHtml::encode($data->nu_tlf_local); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nu_tlf_cel')); ?>:</b>
	<?php echo CHtml::encode($data->nu_tlf_cel); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('id_depen')); ?>:</b>
	<?php echo CHtml::encode($data->id_depen); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('id_cargo')); ?>:</b>
	<?php echo CHtml::encode($data->id_cargo); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('id_grado')); ?>:</b>
	<?php echo CHtml::encode($data->id_grado); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('unidad')); ?>:</b>
	<?php echo CHtml::encode($data->unidad); ?>
	<br />

	*/ ?>

</div>