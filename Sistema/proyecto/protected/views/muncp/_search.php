<?php
/* @var $this MuncpController */
/* @var $model Muncp */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'id_muncp'); ?>
		<?php echo $form->textField($model,'id_muncp'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'nb_muncp'); ?>
		<?php echo $form->textField($model,'nb_muncp',array('size'=>30,'maxlength'=>30)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'id_ciudad'); ?>
		<?php echo $form->textField($model,'id_ciudad'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->