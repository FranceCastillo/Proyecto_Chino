<?php
/* @var $this UnidadesController */
/* @var $model Unidades */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'unidades-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'nb_unid'); ?>
		<?php echo $form->textField($model,'nb_unid',array('size'=>50,'maxlength'=>50)); ?>
		<?php echo $form->error($model,'nb_unid'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'coor_unid'); ?>
		<?php echo $form->textField($model,'coor_unid',array('size'=>60,'maxlength'=>100	)); ?>
		<?php echo $form->error($model,'coor_unid'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'id_prrq'); ?>
		<?php echo $form->dropDownList($model,'id_prrq', CHtml::listData(Parroquia::model()->findAll(), 'id_prrq', 'nb_prrq'),		
			array (
				'prompt'=>'Seleccione Parroquia' 
				)
		); ?>
		<?php echo $form->error($model,'id_prrq'); ?>
	</div>


	<div class="row">
		<?php echo $form->labelEx($model,'persona_encarg'); ?>
		<?php echo $form->textField($model,'persona_encarg',array('size'=>45,'maxlength'=>45)); ?>
		<?php echo $form->error($model,'persona_encarg'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'tipo_unid'); ?>
		<?php echo $form->dropDownList($model,'tipo_unid', CHtml::listData(TipoUnidad::model()->findAll(), 'id_tipo_unidad', 'nb_tipo'),		
			array (
				'prompt'=>'Seleccione Tipo de Unidad' 
				)
		); ?>
		<?php echo $form->error($model,'tipo_unid'); ?>
	</div>


	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Crear' : 'Guardar'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->