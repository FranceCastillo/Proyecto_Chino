<?php
/* @var $this UnidadesController */
/* @var $model Unidades */

$this->breadcrumbs=array(
	'Unidades'=>array('index'),
	$model->id_unid,
);

$this->menu=array(
	array('label'=>'Listar Unidades', 'url'=>array('index')),
	array('label'=>'Crear Unidades', 'url'=>array('create')),
	array('label'=>'Modificar Unidades', 'url'=>array('update', 'id'=>$model->id_unid)),
	array('label'=>'Eliminar Unidades', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id_unid),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Gestionar Unidades', 'url'=>array('admin')),
);
?>

<h1>Ver Unidades # <?php echo $model->nb_unid; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'nb_unid',
		'coor_unid',
		'idPrrq.nb_prrq',
		'persona_encarg',
		'tipoUn.nb_tipo',
	),
)); ?>
<br>
<br>
<html>
<head>
<script type="text/javascript"
    src="https://maps.google.com/maps/api/js?sensor=true">
</script>
<script type="text/javascript">

   function cargar_mapa()
    {
        var myOptions = {
          scaleControl: true,
          center: new google.maps.LatLng(9.915926, -67.362396),
          zoom: 15,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        var map = new google.maps.Map(document.getElementById('map_canvas'),
            myOptions);

        var marker = new google.maps.Marker({
          map: map,
		  title: "mi título",
          position: map.getCenter()
        });
        var infowindow = new google.maps.InfoWindow();
        infowindow.setContent('<b>Mapa</b>');
        google.maps.event.addListener(marker, 'click', function() {
            infowindow.open(map, marker);
        });
		
      }

      google.maps.event.addDomListener(window, 'load', cargar_mapa);

</script>
</head>
<body>
  <div id="map_canvas" style="width:400px; height:300px;"></div>
</body>
</html>
