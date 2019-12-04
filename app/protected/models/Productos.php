<?php

/**
 * This is the model class for table "productos".
 *
 * The followings are the available columns in table 'productos':
 * @property integer $idProductos
 * @property integer $idCategoria
 * @property integer $idProveedor
 * @property string $codigoProd
 * @property string $calidad
 * @property string $referenciaProd
 * @property string $nombreProd
 * @property string $marcaProd
 * @property string $modeloProd
 * @property string $descripcionProd
 * @property string $tipoProd
 * @property string $ubicacionProd
 * @property double $precioProd
 * @property integer $existenciaProd
 *
 * The followings are the available model relations:
 * @property CompraProd[] $compraProds
 * @property Categorias $idCategoria0
 * @property Proveedor $idProveedor0
 * @property Ventas[] $ventases
 */
class Productos extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Productos the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'productos';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('idCategoria, idProveedor, codigoProd, nombreProd, marcaProd, modeloProd, descripcionProd, tipoProd, precioProd, existenciaProd', 'required'),
			array('idCategoria, idProveedor, existenciaProd', 'numerical', 'integerOnly'=>true),
			array('precioProd', 'numerical'),
			array('calidad', 'length', 'max'=>20),
			array('codigoProd', 'length', 'max'=>10),
			array('referenciaProd, marcaProd, modeloProd', 'length', 'max'=>50),
			array('nombreProd', 'length', 'max'=>100),
			array('descripcionProd', 'length', 'max'=>255),
			array('tipoProd', 'length', 'max'=>15),
			array('ubicacionProd', 'length', 'max'=>30),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('idProductos, idCategoria, idProveedor, codigoProd, referenciaProd, nombreProd, marcaProd, modeloProd, descripcionProd, tipoProd, ubicacionProd, precioProd, existenciaProd', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'compraProds' => array(self::HAS_MANY, 'CompraProd', 'idProductos'),
			'idCategoria0' => array(self::BELONGS_TO, 'Categorias', 'idCategoria'),
			'idProveedor0' => array(self::BELONGS_TO, 'Proveedor', 'idProveedor'),
			'ventases' => array(self::HAS_MANY, 'Ventas', 'idProductos'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'idProductos' => 'Id Productos',
			'idCategoria' => 'Id Categoria',
			'idProveedor' => 'Id Proveedor',
			'codigoProd' => 'Codigo del Producto',
			'calidad' => 'Calidad del Producto',
			'referenciaProd' => 'Referencia del Producto',
			'nombreProd' => 'Nombre del Producto',
			'marcaProd' => 'Marca del Producto',
			'modeloProd' => 'Modelo del Producto',
			'descripcionProd' => 'Descripcion',
			'tipoProd' => 'Tipo de Producto',
			'ubicacionProd' => 'Ubicacion',
			'precioProd' => 'Precio del Producto',
			'existenciaProd' => 'Existencia del Producto',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('idProductos',$this->idProductos);
		$criteria->compare('idCategoria',$this->idCategoria);
		$criteria->compare('idProveedor',$this->idProveedor);
		$criteria->compare('calidad',$this->calidad,true);
		$criteria->compare('codigoProd',$this->codigoProd,true);
		$criteria->compare('referenciaProd',$this->referenciaProd,true);
		$criteria->compare('nombreProd',$this->nombreProd,true);
		$criteria->compare('marcaProd',$this->marcaProd,true);
		$criteria->compare('modeloProd',$this->modeloProd,true);
		$criteria->compare('descripcionProd',$this->descripcionProd,true);
		$criteria->compare('tipoProd',$this->tipoProd,true);
		$criteria->compare('ubicacionProd',$this->ubicacionProd,true);
		$criteria->compare('precioProd',$this->precioProd);
		$criteria->compare('existenciaProd',$this->existenciaProd);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}
