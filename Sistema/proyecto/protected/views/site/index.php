<?php
/* @var $this SiteController */

$this->pageTitle=Yii::app()->name;
?>



<h1>Bienvenido<i><?php echo CHtml::encode(Yii::app()->name); ?></i></h1> 

<center><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/milicia.jpg" height="240px" width="280" align="center" padding="20px"><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/milicia2.jpg" height="240px" width="280" align="center" padding="20px"></center>	
		
<?php
//Para colocar el nombre de la app
//php echo CHtml::encode(Yii::app()->name); 
?>
