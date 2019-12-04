<?php
/* @var $this PersonalController */
/* @var $model Personal */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'personal-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'nu_docm_idnt'); ?>
		<?php echo $form->textField($model,'nu_docm_idnt'); ?>
		<?php echo $form->error($model,'nu_docm_idnt'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'username'); ?>
		<?php echo $form->dropDownList($model,'username',array('invitado'=>'invitado'),
			array(
				'prompt'=>'Seleccione'
				)
		); ?>
		<?php echo $form->error($model,'username'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'nombre'); ?>
		<?php echo $form->textField($model,'nombre',array('size'=>30,'maxlength'=>30)); ?>
		<?php echo $form->error($model,'nombre'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'apellido'); ?>
		<?php echo $form->textField($model,'apellido',array('size'=>30,'maxlength'=>30)); ?>
		<?php echo $form->error($model,'apellido'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'sexo'); ?>
		<?php echo $form->dropDownList($model,'sexo',array('M'=>'Masculino','F'=>'Femenino'),
			array(
				'prompt'=>'Seleccione'
				)
		); ?>
		<?php echo $form->error($model,'sexo'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'email'); ?>
		<?php echo $form->textField($model,'email',array('size'=>30,'maxlength'=>30)); ?>
		<?php echo $form->error($model,'email'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'nu_tlf_local'); ?>
		<?php echo $form->textField($model,'nu_tlf_local',array('size'=>15,'maxlength'=>15)); echo " Ej: 0246-1234567"?>
		<?php echo $form->error($model,'nu_tlf_local'); ?>
	</div>


	<div class="row">
		<?php echo $form->labelEx($model,'nu_tlf_cel'); ?>
		<?php echo $form->textField($model,'nu_tlf_cel',array('size'=>15,'maxlength'=>15)); echo " Ej: 0414-1234567"?>
		<?php echo $form->error($model,'nu_tlf_cel'); ?>
	</div>


	<div class="row">
		<?php echo $form->labelEx($model,'id_depen'); ?>
		<?php echo $form->dropDownList($model,'id_depen', CHtml::listData(Depend::model()->findAll(), 'id_dep', 'nb_dep'),		
			array (
				'prompt'=>'Seleccione Dependencia' 
				)
		); ?>
		<?php echo $form->error($model,'id_depen'); ?>
	</div>


	<div class="row">
		<?php echo $form->labelEx($model,'id_cargo'); ?>
		<?php echo $form->dropDownList($model,'id_cargo', CHtml::listData(Cargos::model()->findAll(), 'id_cargos', 'nb_cargos'),		
			array (
				'prompt'=>'Seleccione Cargo' 
				)
		); ?>
		<?php echo $form->error($model,'id_cargo'); ?>
	</div>


	<div class="row">
		<?php echo $form->labelEx($model,'id_grado'); ?>
		<?php echo $form->dropDownList($model,'id_grado', CHtml::listData(Grados::model()->findAll(), 'id_grados', 'nb_grados'),		
			array (
				'prompt'=>'Seleccione Grado' 
				)
		); ?>
		<?php echo $form->error($model,'id_grado'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'unidad'); ?>
		<?php echo $form->dropDownList($model,'unidad', CHtml::listData(Unidades::model()->findAll(), 'id_unid', 'nb_unid'),		
			array (
				'prompt'=>'Seleccione Unidad' 
				)
		); ?>
		<?php echo $form->error($model,'id_unid'); ?>
	</div>


	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Crear' : 'Guardar'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->