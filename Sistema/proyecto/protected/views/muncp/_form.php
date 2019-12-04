<?php
/* @var $this MuncpController */
/* @var $model Muncp */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'muncp-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'nb_muncp'); ?>
		<?php echo $form->textField($model,'nb_muncp',array('size'=>30,'maxlength'=>30)); ?>
		<?php echo $form->error($model,'nb_muncp'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'id_ciudad'); ?>
		<?php echo $form->dropDownList($model,'id_ciudad', CHtml::listData(Ciudad::model()->findAll(), 'id_ciudad', 'nb_ciudad'),		
			array (
				'prompt'=>'Seleccione Ciudad' 
				)
		); ?>
		<?php echo $form->error($model,'id_ciudad'); ?>
	</div>


	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->