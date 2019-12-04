<?php
/* @var $this TipoUnidadController */
/* @var $model TipoUnidad */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'id_tipo_unidad'); ?>
		<?php echo $form->textField($model,'id_tipo_unidad'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'nb_tipo'); ?>
		<?php echo $form->textField($model,'nb_tipo',array('size'=>30,'maxlength'=>30)); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->