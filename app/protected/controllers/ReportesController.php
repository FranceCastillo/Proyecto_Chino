<?php

class ReportesController extends Controller
{
	public function actionProductos()
	{
        $dataProvider=new CActiveDataProvider('Productos');
		$this->render('productos',array(
			'dataProvider'=>$dataProvider,
		));
	}

	public function actionProveedores()
	{
        $dataProvider=new CActiveDataProvider('Proveedor');
		$this->render('proveedores',array(
			'dataProvider'=>$dataProvider,
		));
	}

	public function actionCompras()
	{
        $dataProvider=new CActiveDataProvider('CompraProd');
		$this->render('compras',array(
			'dataProvider'=>$dataProvider,
		));
	}

	public function actionVentas()
	{
        $dataProvider=new CActiveDataProvider('Ventas');
		$this->render('ventas',array(
			'dataProvider'=>$dataProvider,
		));
	}

	public function actionClientes()
	{
        $dataProvider=new CActiveDataProvider('Cliente');
		$this->render('clientes',array(
			'dataProvider'=>$dataProvider,
		));
	}
}
