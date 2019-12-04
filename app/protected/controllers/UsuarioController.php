<?php

class UsuarioController extends Controller
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
            $model=Usuario::model()->findAll();
    	    header('Content-type: application/json');
    	    echo '{data:'.CJSON::encode($model).'}';
        }else{
        $this->render('index');
        }
	}

	public function actionCrear()
	{
		$model=new Usuario;
		if($_POST)
		{
			$model->attributes=$_POST;
            $model->password=md5($_POST['Usuario']['password']);
			if($model->save()){
      	        echo '{"success": true, "message":{"reason": "Los datos se guardaron exitosamente."}}';
            }
		}else{
        $this->render('index');
        }
	}

	public function actionActualizar()
	{
		if($_POST)
		{
            $post=Usuario::model()->findByPk($_POST['id']);
            $post->attributes=$_POST;
            $post->save();

		}else{
        $this->render('index');
        }
	}

    public function actionEliminar()
    {
        if($_POST){
            $post=Usuario::model()->findByPk($_POST['id']); // assuming there is a post whose ID is 10
            $post->delete(); // delete the row from the database table
        }else{
        $this->render('index');
        }
    }


}