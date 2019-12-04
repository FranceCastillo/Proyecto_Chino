<?php
/* @var $this CargosController */
/* @var $model Cargos */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'id_cargos'); ?>
		<?php echo $form->textField($model,'id_cargos'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'Nombre del Cargo'); ?>
		<?php echo $form->textField($model,'nb_cargos',array('size'=>50,'maxlength'=>50)); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->