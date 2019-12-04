<?php
/* @var $this CiudadController */
/* @var $model Ciudad */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'ciudad-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'nb_ciudad'); ?>
		<?php echo $form->textField($model,'nb_ciudad',array('size'=>30,'maxlength'=>30)); ?>
		<?php echo $form->error($model,'nb_ciudad'); ?>
	</div>


	<div class="row">
		<?php echo $form->labelEx($model,'id_edo'); ?>
		<?php echo $form->dropDownList($model,'id_edo', CHtml::listData(Estado::model()->findAll(), 'id_edo', 'nb_edo'),		
			array (
				'prompt'=>'Seleccione Estado' 
				)
		); ?>
		<?php echo $form->error($model,'id_edo'); ?>
	</div>


	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->