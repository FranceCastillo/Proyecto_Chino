<?php

class EstadisticasController extends Controller
{
	public function filters()
	{
		return array(
			'accessControl', // perform access control for CRUD operations
			'postOnly + delete', // we only allow deletion via POST request
		);
	}

	public function accessRules()
	{
		return array(
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('index', 'verLinea', 'verTorta','verTortaCalidad'),
				'users'=>array('@'),
			),
			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('delete'),
				'users'=>array('admin'),
			),
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}



        public function actionVerTortaCalidad(){

                $consulta = Yii::app()->db->createCommand()
                    ->select(' COUNT(CASE WHEN calidad="Apto" THEN calidad END) AS apto, COUNT(CASE WHEN calidad="Defectuoso" THEN calidad END) AS defectuoso')
                    ->from('productos')
                    ->queryAll();

                    foreach($consulta as $res){

                        $apro=$res['apto'];
                                $repro=$res['defectuoso'];

                    }

                    echo "[[\"Aptos\", ".$apro."], [\"Defectuosos\", ".$repro."]]";
        }


	public function actionIndex(){
		$this->render('index');
	}


	public function actionVerLinea(){


	$total = array("0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0");

	$consulta = Yii::app()->db->createCommand()
	    ->select('count(fechaVent) AS total, MONTH(fechaVent) AS mes')
	    ->from('ventas')
	    ->where('fechaVent BETWEEN "'.$_GET['fechaD'].'" AND  "'.$_GET['fechaH'].'" ')
	    ->group('MONTH(fechaVent)')
	    ->queryAll();

            foreach($consulta as $res){

                if($res['mes'] ==1){

                	$total[0]=$res['total'];
					//$repro[0]=$res['repro'];

				}elseif($res['mes'] == 2){

					$total[1]=$res['total'];
					//$repro[1]=$res['repro'];

				}elseif($res['mes'] == 3){

					$total[2]=$res['total'];
					//$repro[2]=$res['repro'];

				}elseif($res['mes'] == 4){

					$total[3]=$res['total'];
					//$repro[3]=$res['repro'];

				}elseif($res['mes'] == 5){

					$total[4]=$res['total'];
					//$repro[4]=$res['repro'];

				}elseif($res['mes'] == 6){

					$total[5]=$res['total'];
					//$repro[5]=$res['repro'];

				}elseif($res['mes'] == 7){

					$total[6]=$res['total'];
					//$repro[6]=$res['repro'];

				}elseif($res['mes'] == 8){

					$total[7]=$res['total'];
					//$repro[7]=$res['repro'];

				}elseif($res['mes'] == 9){

					$total[8]=$res['total'];
					//$repro[8]=$res['repro'];

				}elseif($res['mes'] == 10){

					$total[9]=$res['total'];
					//$repro[9]=$res['repro'];

				}elseif($res['mes'] == 11){

					$total[10]=$res['total'];
					//$repro[10]=$res['repro'];

				}elseif($res['mes'] == 12){

					$total[11]=$res['total'];
					//$repro[11]=$res['repro'];

				}
            }

			$total=implode(", ", $total);
			//$repro=implode(", ", $repro);
			echo "[{\"name\" : \"total\", \"data\" : [".$total."]}]";

    }

	public function actionVerTorta(){

		$consulta = Yii::app()->db->createCommand()
		    ->select('count(t1.idProductos) AS cantidad, t2.nombreProd AS producto')
		    ->from('ventas t1, productos t2')
		    ->where('fechaVent BETWEEN "'.$_GET['fechaD'].'" AND  "'.$_GET['fechaH'].'" AND t1.idProductos=t2.idProductos')
		    ->group('nombreProd')
		    ->queryAll();


		    foreach($consulta as $res){

		    	if(is_null(@$json)){
				
					@$json=$json."["."\"".$res['producto']."\"".", ".$res['cantidad']."]";
				}else{
					@$json=$json.", ["."\"".$res['producto']."\"".", ".$res['cantidad']."]";

				}	
				
			}


		    echo "[".$json."]";
	}

}
