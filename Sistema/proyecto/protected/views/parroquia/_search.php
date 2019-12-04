<?php
/* @var $this ParroquiaController */
/* @var $model Parroquia */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'id_prrq'); ?>
		<?php echo $form->textField($model,'id_prrq'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'nb_prrq'); ?>
		<?php echo $form->textField($model,'nb_prrq',array('size'=>30,'maxlength'=>30)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'id_muncp'); ?>
		<?php echo $form->textField($model,'id_muncp'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->