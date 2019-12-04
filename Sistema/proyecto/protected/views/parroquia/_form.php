<?php
/* @var $this ParroquiaController */
/* @var $model Parroquia */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'parroquia-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'nb_prrq'); ?>
		<?php echo $form->textField($model,'nb_prrq',array('size'=>30,'maxlength'=>30)); ?>
		<?php echo $form->error($model,'nb_prrq'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'id_muncp'); ?>
		<?php echo $form->dropDownList($model,'id_muncp', CHtml::listData(Muncp::model()->findAll(), 'id_muncp', 'nb_muncp'),		
			array (
				'prompt'=>'Seleccione Municipio' 
				)
		); ?>
		<?php echo $form->error($model,'id_muncp'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->