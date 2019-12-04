<?php
/* @var $this UnidadesController */
/* @var $data Unidades */
?>

<div class="view">

<?php
	/*
	<b><?php echo CHtml::encode($data->getAttributeLabel('id_unid')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id_unid), array('view', 'id'=>$data->id_unid)); ?>
	<br />
   */
	?>
	<b><?php echo CHtml::encode($data->getAttributeLabel('nb_unid')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->nb_unid), array('view', 'id'=>$data->id_unid)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('coor_unid')); ?>:</b>
	<?php echo CHtml::encode($data->coor_unid); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('id_prrq')); ?>:</b>
	<?php echo CHtml::encode($data->idPrrq->nb_prrq); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('persona_encarg')); ?>:</b>
	<?php echo CHtml::encode($data->persona_encarg); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('tipo_unid')); ?>:</b>
	<?php echo CHtml::encode($data->tipoUn->nb_tipo); ?>
	<br />


</div>