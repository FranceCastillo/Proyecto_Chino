<?php

class ReportesController extends Controller
{
	public function actionUnidades()
	{
        $dataProvider=new CActiveDataProvider('Unidades');
		$this->render('unidades',array(
			'dataProvider'=>$dataProvider,
		));
	}

	public function actionPersonal()
	{
        $dataProvider=new CActiveDataProvider('Personal');
		$this->render('personal',array(
			'dataProvider'=>$dataProvider,
		));
	}

}
