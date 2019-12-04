<?php

class StoresController extends Controller
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
				'actions'=>array('index','verTplProv', 'verTplCat','verTplProd', 'verTplCli'),
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





	public function actionIndex()
	{
		$this->render('index');
	}



	public function actionVerTplProv(){
        if($_POST){ 

     		$rifProv=$_POST['query'];

            $model=Proveedor::model()->findAll('rifProv LIKE :match', array(':match' => "%$rifProv%"));
    	    header('Content-type: application/json');
    	    echo '{data:'.CJSON::encode($model).'}';
        }else{
            $this->render('index');
        }
	}


    public function actionVerTplCat(){
        if($_POST){ 

            $nombreCat=$_POST['query'];

            $model=Categorias::model()->findAll('nombreCate LIKE :match', array(':match' => "%$nombreCat%"));
            header('Content-type: application/json');
            echo '{data:'.CJSON::encode($model).'}';
        }else{
            $this->render('index');
        }
    }
    
        public function actionVerTplProd(){
        if($_POST){ 

            $codigoProd=$_POST['query'];

            $model=Productos::model()->findAll('codigoProd LIKE :match', array(':match' => "%$codigoProd%"));
            header('Content-type: application/json');
            echo '{data:'.CJSON::encode($model).'}';
        }else{
            $this->render('index');
        }
    }



    public function actionVerTplCli(){
        if($_POST){ 

            $cedula=$_POST['query'];

            $model=Cliente::model()->findAll('cedulaRifCli LIKE :match', array(':match' => "%$cedula%"));
            header('Content-type: application/json');
            echo '{data:'.CJSON::encode($model).'}';
        }else{
            $this->render('index');
        }
    }



}
