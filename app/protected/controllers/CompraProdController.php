<?php

class CompraProdController extends Controller
{
	public function actionIndex()
	{
		$this->render('index');
	}


	public function filters()
	{
		return array(
			'accessControl', // perform access control for CRUD operations
		);
	}

	public function accessRules()
	{
		return array(
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('crear','actualizar','index','ver'),
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

	public function actionVer()
	{
     if($_POST){
            $model=CompraProd::model()->findAll();
            foreach($model as $dato){
                $dato->idProductos=$dato->idProductos0->codigoProd." - ".$dato->idProductos0->nombreProd;
            }
    	    header('Content-type: application/json');
    	    echo '{data:'.CJSON::encode($model).'}';
        }else{
        $this->render('index');
        }
	}

	public function actionCrear()
	{
		$model=new CompraProd;
		if($_POST)
		{   
            $productos=Productos::model()->findByPk($_POST['idProductos']);
            $productos->existenciaProd=$productos->existenciaProd + $_POST['unidadProd'];
            if($productos->save()){
			    $model->attributes=$_POST;
			    if($model->save()){
      	             echo '{"success": true, "message":{"reason": "Los datos se guardaron exitosamente."}}';
                }
            }
		}else{
        $this->render('index');
        }
	}

	public function actionActualizar()
	{
		if($_POST)
		{
            $post=CompraProd::model()->findByPk($_POST['id']);
            $post->attributes=$_POST;
            $post->save();

		}else{
        $this->render('index');
        }
	}

    public function actionEliminar()
    {
        if($_POST){
            $post=CompraProd::model()->findByPk($_POST['id']); // assuming there is a post whose ID is 10
            $post->delete(); // delete the row from the database table
        }else{
        $this->render('index');
        }
    }


}
