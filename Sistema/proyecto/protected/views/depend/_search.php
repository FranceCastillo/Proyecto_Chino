<?php
/* @var $this DependController */
/* @var $model Depend */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'id_dep'); ?>
		<?php echo $form->textField($model,'id_dep'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'nb_dep'); ?>
		<?php echo $form->textField($model,'nb_dep',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->