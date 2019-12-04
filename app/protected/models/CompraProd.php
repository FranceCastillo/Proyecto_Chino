<?php

/**
 * This is the model class for table "compraProd".
 *
 * The followings are the available columns in table 'compraProd':
 * @property integer $idCompraProd
 * @property integer $idProductos
 * @property integer $unidadProd
 * @property string $fechaIngProd
 * @property string $costoProd
 *
 * The followings are the available model relations:
 * @property Productos $idProductos0
 */
class CompraProd extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return CompraProd the static model class
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
		return 'compraProd';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('idProductos, unidadProd, fechaIngProd', 'required'),
			array('idProductos, unidadProd', 'numerical', 'integerOnly'=>true),
			array('costoProd', 'length', 'max'=>9),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('idCompraProd, idProductos, unidadProd, fechaIngProd, costoProd', 'safe', 'on'=>'search'),
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
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'idCompraProd' => 'Id de Compra',
			'idProductos' => 'Id de Productos',
			'unidadProd' => 'Unidad de Producto',
			'fechaIngProd' => 'Fecha',
			'costoProd' => 'Costo',
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

		$criteria->compare('idCompraProd',$this->idCompraProd);
		$criteria->compare('idProductos',$this->idProductos);
		$criteria->compare('unidadProd',$this->unidadProd);
		$criteria->compare('fechaIngProd',$this->fechaIngProd,true);
		$criteria->compare('costoProd',$this->costoProd,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}
