<?php
@session_start();
//conectar a la base de datos
function conectar()
{
	$idc=mysqli_connect('localhost','root','','redill');
	if(!$idc)
	{
		echo 'Error Conectando con Servidor o la base de datos '.mysqli_error($idc);
		die();
	}
	
	return $idc;
}
//excluye una sentencia sql

function rollback($c)
{
	return @mysqli_rollback($c); 
}
//ejecuta una sentencia sql

function commit($c)
{
	return @mysqli_commit($c); 
}
//ejecuta una sentencia sql, devuelve un arreglo con el resultado

function consultar($c,$sql)
{
	return @mysqli_query($c,$sql); 
}
 //cuenta cantidad de registros que contiene el resultdo de ejecutar un sentencia sql
function cantidad($r)
{
	return @mysqli_num_rows($r); 
}
//convierte en un arreglo asociativo lis registros que contiene el resultdo de ejecutar un sentencia sql
function asociativo($r)
{
	return @mysqli_fetch_array($r); 
}
//cierra una conexion a la base de datos
function cerrar($c)
{
	@mysqli_close($c); 
	}
	
//--------------------------------------------------Niveles de usuario-----------------------------------------------------------

function usuario_conectado()
{
	if(isset($_SESSION['id_usuario_activo']) && $_SESSION['id_usuario_activo']>0)
		return true;
	else
		return false;
		
}
function administrador()
{
	if(isset($_SESSION['nivel_usuario_activo']) && $_SESSION['nivel_usuario_activo']==1)
		return true;
	else
		return false;
}
function visitante()
{
	if(isset($_SESSION['nivel_usuario_activo']) && $_SESSION['nivel_usuario_activo']==2)
		return true;
	else
		return false;
}

//--------------------------------------------------calendario-----------------------------------------------------------

function calendario(){
# definimos los valores iniciales para nuestro calendario
 $month=date("n"); $year=date("Y"); $diaActual=date("j"); $diaSemana=''; $day='';
 # Obtenemos el dia de la semana del primer dia 
 # Devuelve 0 para domingo, 6 para sabado 
 $diaSemana=date("w",mktime(0,0,0,$month,1,$year))+7; 
 # Obtenemos el ultimo dia del mes 
 $ultimoDiaMes=date("d",(mktime(0,0,0,$month+1,1,$year)-1)); 
 $meses=array(1=>"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"); 
 ?> 
	  <table id="calendar"> <caption><?php echo $meses[$month]." ".$year?></caption> 
	  <tr> <th>Lun</th><th>Mar</th><th>Mie</th><th>Jue</th> <th>Vie</th><th>Sab</th><th>Dom</th> 
	  </tr> 
	  <tr bgcolor="silver"> <?php $last_cell=$diaSemana+$ultimoDiaMes; 
	  // hacemos un bucle hasta 42, que es el máximo de valores que puede 
	  // haber... 6 columnas de 7 dias 
	  for($i=1;$i<=42;$i++) { 
	  if($i==$diaSemana) { 
	  // determinamos en que dia empieza 
	  $day=1; 
	  } 
	  if($i<$diaSemana || $i>=$last_cell){ 
	  // celca vacia 
	  echo "<td> </td>"; 
	  }else{ 
	  // mostramos el dia 
	  if($day==$diaActual) 
	  echo "<td class='hoy'>$day</td>"; 
	  else echo "<td>$day</td>";
	  $day++;  
	  } 
	  // cuando llega al final de la semana, iniciamos una columna nueva 
	  if($i%7==0) { 
	  echo "</tr><tr>\n";
	  } } 
	   ?> 
	   </tr>
	   </table> 
		<?php
		}
		

//--------------------------------------------------reloj digital-----------------------------------------------------------

	function reloj_digital(){
	?>
	<p class="estado-cabecera">
	<img src="../../imagenes/numeros/dg8.gif" name="hr1"><img 
	src="../../imagenes/numeros/dg8.gif" name="hr2"><img 
	src="../../imagenes/numeros/dgc.gif" name="c"><img 
	src="../../imagenes/numeros/dg8.gif" name="mn1"><img 
	src="../../imagenes/numeros/dg8.gif" name="mn2"><img 
	src="../../imagenes/numeros/dgc.gif" name="c"><img 
	src="../../imagenes/numeros/dg8.gif" name="se1"><img 
	src="../../imagenes/numeros/dg8.gif" name="se2"><img 
	src="../../imagenes/numeros/dgpm.gif" name="ampm">
	</p>
	<?php
	}
	
	//----------------------------------menu-------------------------------------------------------------------------
	
	function menu(){
	?>
	<ul>
	   <li class='active'><a href='../menu/inicio.php'><span>INICIO</span></a></li>
	     <li class='has-sub'><a href='#'><span>REGISTRAR</span></a>
		<ul>
			 <li><a href='../opciones/registrar_unidad.php'><span>REGISTRAR UNIDAD</span></a></li>
			 <li><a href='../opciones/registrar_persona.php'><span>REGISTRAR PERSONA</span></a></li>
			 <hr ></hr>
			  <li><a href='../opciones/registrar_redi.php'><span>REGISTRAR REDI</span></a></li>
			 <li><a href='../opciones/registrar_zodi.php'><span>REGISTRAR ZODI</span></a></li>
			 <li><a href='../opciones/registrar_adi.php'><span>REGISTRAR ADI</span></a></li>
			 <li><a href='../opciones/registrar_municipio.php'><span>REGISTRAR MUNICIPIO</span></a></li>
			 <li><a href='../opciones/registrar_parroquia.php'><span>REGISTRAR PARROQUIA</span></a></li>
		  </ul>
	   </li>
	   <li class='has-sub'><a href='#'><span>BUSCAR</span></a>
	   		  <ul>
	    	 <li><a href='../opciones/buscar_registros_unidad.php'><span>BUSCAR REGISTROS UNIDAD</span></a></li>
			 <li><a href='../opciones/buscar_registros_persona.php'><span>BUSCAR REGISTROS PERSONA</span></a></li>
			 </ul>
	   </li>
	   <?php
	   if(administrador()){
	   ?>
		<li class='has-sub'><a href='#'><span>USUARIOS</span></a>
	   <ul>
			 <li><a href='../opciones/listado_usuarios.php'><span>LISTADO USUARIOS</span></a></li>
			 <li><a href='../opciones/buscar_usuarios.php'><span>BUSCAR USUARIOS</span></a></li>
			 <li class='last'><a href='../opciones/registrar_usuarios.php'><span>REGISTRAR USUARIOS</span></a></li>
		  </ul>
	   </li>
	   <?php
	   }
	   ?>
	   <li class='has-sub'><a href='#'><span>AUDITORIAS</span></a>
	   <ul>
			 <li><a href='../opciones/listado_auditoria.php'><span>LISTADO</span></a></li>
			 <li class='last'><a href='../opciones/auditoria_buscar.php'><span>BUSQUEDA</span></a></li>
		  </ul>
	   </li>
	    <?php
	   if(administrador()){
	   ?>
	   <li class='has-sub'><a href='#'><span>RESPALDO</span></a> 
	   <ul>
			 <li><a href='../menu/respaldo.php' title="Seleccione para respaldar la base de datos"><span>RESPALDAR</span></a></li>
			 <li class='last'><a href='../menu/restore.php' title="Seleccione para restaurar la base de datos"><span>RESTAURAR</span></a></li>
		  </ul>
	   </li>
	    <?php
	   }
	   ?>
	   <li class='last'><a href='../menu/cerrar_sesion.php' title="cerrar sesion"><span>CERRAR SESION</span></a></li> 
	</ul>
	<?php
	
	}
	
	