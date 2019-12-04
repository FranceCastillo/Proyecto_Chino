<?php
/* @var $this UnidadesController */
/* @var $model Unidades */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'id_unid'); ?>
		<?php echo $form->textField($model,'id_unid'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'nb_unid'); ?>
		<?php echo $form->textField($model,'nb_unid',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'coor_unid'); ?>
		<?php echo $form->textField($model,'coor_unid',array('size'=>60,'maxlength'=>100)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'id_prrq'); ?>
		<?php echo $form->textField($model,'id_prrq'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'persona_encarg'); ?>
		<?php echo $form->textField($model,'persona_encarg',array('size'=>45,'maxlength'=>45)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'tipo_unid'); ?>
		<?php echo $form->textField($model,'tipo_unid'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->