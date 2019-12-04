<!DOCTYPE html>
    <head>

    <title>M6HKTCA</title>
    <meta name="author" content="SuggeElson" />

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
        <!-- ////// extjs /////// -->
    <script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/ext/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/ext/ext-all.js"></script>
    <script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/row-editor.js"></script>
    <script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/FilterRow.js"></script>
    <script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/GroupSummary.js"></script>
    <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/ext/resources/css/ext-all-notheme.css" />
    <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/ext/resources/css/xtheme-gray.css" />  
    <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/FilterRow.css" />
    <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/RowEditor.css" />
    <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/GroupSummary.css" />

 

    <link href="<?php echo Yii::app()->request->baseUrl; ?>/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="c<?php echo Yii::app()->request->baseUrl; ?>/css/bootstrap/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo Yii::app()->request->baseUrl; ?>/css/supr-theme/jquery.ui.supr.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo Yii::app()->request->baseUrl; ?>/css/icons.css" rel="stylesheet" type="text/css" />

    <link href="<?php echo Yii::app()->request->baseUrl; ?>/css/jquery.qtip.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo Yii::app()->request->baseUrl; ?>/css/main.css" rel="stylesheet" type="text/css" /> 

    <script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/bootstrap/bootstrap.js"></script>  
    <script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/jquery.qtip.min.js"></script>
    <script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/jquery.ui.touch-punch.min.js"></script>
    <script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/main.js"></script>


    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="<?php echo Yii::app()->request->baseUrl; ?>/images/favicon.ico" />
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="<?php echo Yii::app()->request->baseUrl; ?>/images/apple-touch-icon-144-precomposed.png" />
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="<?php echo Yii::app()->request->baseUrl; ?>/images/apple-touch-icon-114-precomposed.png" />
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="<?php echo Yii::app()->request->baseUrl; ?>/images/apple-touch-icon-72-precomposed.png" />
    <link rel="apple-touch-icon-precomposed" href="<?php echo Yii::app()->request->baseUrl; ?>/images/apple-touch-icon-57-precomposed.png" />
    
    <script type="text/javascript">
        //adding load class to body and hide page
        document.documentElement.className += 'loadstate';
    </script>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
      
    <body>
    <!-- loading animation -->
    <div id="qLoverlay"></div>
    <div id="qLbar"></div>
    
    <div id="header">


            
              
              <div class="navbar">
                <a class="brand" href="index.php"><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/logo2.png" class="image" height="50px"></a>
                <div class="nav-no-collapse">
                    <ul class="nav"> 
                        
<?php
$modelo=Productos::model()->findAll("existenciaProd < 15");
$total=count($modelo);

?>
                         <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <span class="icon16 icomoon-icon-bell"></span><span class="notification"><?php echo $total; ?></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="menu">
                                    <ul class="notif">
                                        <li class="header"><strong>Usted tiene (<?php echo $total; ?>) notificaciones</strong></li>
                                        <?php foreach($modelo as $dato){ ?>
                                        <li>
                                            <a href="index.php?r=compraProd/index">
                                                <span class="icon16 icomoon-icon-stats-up"></span>Queda poco/a <?php echo $dato["codigoProd"]." - ".$dato["nombreProd"];?>
                                            </a>
                                        </li>
                                        <?php } ?>
                                    </ul>
                                </li>
                            </ul>
                        </li>
        
                   
                    </ul>



              
                    <ul class="nav pull-right usernav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle avatar" data-toggle="dropdown">
                                <img src="<?php echo Yii::app()->request->baseUrl; ?>/images/pdf.png" alt="" class="image" /> 
                                <span class="txt">Reportes</span>
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="menu">
                                    <ul>
                                        <li>
                                            <a href="index.php?r=reportes/productos"><span class="icon16 icomoon-icon-calendar" a></span>Lista de Productos</a>
                                        </li>
                                        <li>
                                            <a href="index.php?r=reportes/proveedores"><span class="icon16 icomoon-icon-calendar" a></span>Lista de Proveedores</a>
                                        </li>
                                        <li>
                                            <a href="index.php?r=reportes/clientes"><span class="icon16 icomoon-icon-calendar" a></span>Lista de Clientes</a>
                                        </li>
                                        <li>
                                            <a href="index.php?r=reportes/compras"><span class="icon16 icomoon-icon-calendar" a></span>Lista de Compras</a>
                                        </li>
                                        <li>
                                            <a href="index.php?r=reportes/ventas"><span class="icon16 icomoon-icon-calendar" a></span>Lista de Ventas</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li><a href="index.php?r=site/logout"><span class="icon16 icomoon-icon-exit"></span> Salir</a></li>
                    </ul>





                </div><!-- /.nav-collapse -->
              </div>
            </div><!-- /navbar-inner -->
          </div><!-- /navbar --> 

    </div><!-- End #header -->

    <div id="wrapper">

        <!--Sidebar background-->
        <div id="sidebarbg"></div>
        <!--Sidebar content-->
        <div id="sidebar">

            <div class="shortcuts">
                <ul>                    
                    <li><a href="index.php?r=respaldo/respaldo" title="Respaldo BD" class="tip"><span class="icon24 icomoon-icon-database"></span></a></li>
                    <li><a href="index.php?r=estadisticas/index" title="Estadísticas" class="tip"><span class="icon24 iconic-icon-chart"></span></a></li>                  
                    <li><a href="<?php echo Yii::app()->request->baseUrl;?>/docs/manual.pdf" title="Ayuda" class="tip" target="_NEW"><span class="icon24 icomoon-icon-support"></span></a></li>
                </ul>
            </div><!-- End search -->            

            <div class="sidenav">

                <div class="sidebar-widget" style="margin: -1px 0 0 0;">
                    <h5 class="title" style="margin-bottom:0">Menú de Opciones</h5>
                </div><!-- End .sidenav-widget -->

                <div class="mainnav">
                    <ul>
                        <li><a href="?r=cliente/index"><span class="icon16 icomoon-icon-cube"></span>Clientes</a></li>
	                    <li><a href="?r=proveedor/index"><span class="icon16 icomoon-icon-feed"></span>Proveedores</a></li>
                        <li><a href="?r=categorias/index"><span class="icon16 brocco-icon-calendar"></span>Categorias</a></li>
                        <li><a href="?r=usuario/index"><span class="icon16 icomoon-icon-user"></span>Usuarios</a></li>
                        <li><a href="?r=productos/index"><span class="icon16 icomoon-icon-tag"></span>Productos</a></li>
                        <li><a href="?r=CompraProd/index"><span class="icon16 icomoon-icon-cart"></span>Compras</a></li>
                        <li><a href="?r=ventas/index"><span class="icon16 icomoon-icon-undo"></span>Ventas</a></li>
                        <li><a href="?r=ventas/ver"><span class="icon16 icomoon-icon-stats-up"></span>Lista de Ventas</a></li>


                    </ul>
                </div>
            </div><!-- End sidenav -->




          

      

        </div><!-- End #sidebar -->

        <!--Body content-->
        <div id="content" class="clearfix">
            <div class="contentwrapper"><!--Content wrapper-->

                <div class="heading">
                    <div class="resBtnSearch">
                        <a href="#"><span class="icon16 brocco-icon-search"></span></a>
                    </div>
                </div>





                <!-- ////// Contenido  ///// -->
                <div class="row-fluid">


<?php 
$content=str_replace('<div class="container">',"",$content);
$content=str_replace('<div id="content">',"",$content);
echo $content; 
?>



               </div>
               <!-- ////// fin contenido /////// -->




                
            </div>
        </div>
    
    </div>
    <script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl;?>/ext/src/locale/ext-lang-es.js"></script>

    </body>
</html>

