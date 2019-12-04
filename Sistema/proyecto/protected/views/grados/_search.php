<?php
/* @var $this GradosController */
/* @var $model Grados */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'id_grados'); ?>
		<?php echo $form->textField($model,'id_grados'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'nb_grados'); ?>
		<?php echo $form->textField($model,'nb_grados',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->