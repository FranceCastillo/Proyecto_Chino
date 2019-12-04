<?php

/**
 * This is the model class for table "ventas".
 *
 * The followings are the available columns in table 'ventas':
 * @property integer $idVentas
 * @property integer $idCliente
 * @property integer $idProductos
 * @property string $codigoVent
 * @property integer $cantidadPVent
 * @property string $fechaVent
 * @property string $totalVent
 *
 * The followings are the available model relations:
 * @property Productos $idProductos0
 * @property Cliente $idCliente0
 */
class Ventas extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Ventas the static model class
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
		return 'ventas';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('idCliente, idProductos, codigoVent, cantidadPVent, fechaVent, totalVent', 'required'),
			array('idCliente, idProductos, cantidadPVent', 'numerical', 'integerOnly'=>true),
			array('codigoVent', 'length', 'max'=>30),
			array('totalVent', 'length', 'max'=>9),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('idVentas, idCliente, idProductos, codigoVent, cantidadPVent, fechaVent, totalVent', 'safe', 'on'=>'search'),
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
			'idProductos0' => array(self::BELONGS_TO, 'Productos', 'idProductos'),
			'idCliente0' => array(self::BELONGS_TO, 'Cliente', 'idCliente'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'idVentas' => 'Id Ventas',
			'idCliente' => 'Id Cliente',
			'idProductos' => 'Id Productos',
			'codigoVent' => 'Codigo de Venta',
			'cantidadPVent' => 'Cantidad de productos',
			'fechaVent' => 'Fecha',
			'totalVent' => 'Total de la Venta',
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

		$criteria->compare('idVentas',$this->idVentas);
		$criteria->compare('idCliente',$this->idCliente);
		$criteria->compare('idProductos',$this->idProductos);
		$criteria->compare('codigoVent',$this->codigoVent,true);
		$criteria->compare('cantidadPVent',$this->cantidadPVent);
		$criteria->compare('fechaVent',$this->fechaVent,true);
		$criteria->compare('totalVent',$this->totalVent,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}
