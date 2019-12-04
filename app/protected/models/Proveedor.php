<?php

/**
 * This is the model class for table "proveedor".
 *
 * The followings are the available columns in table 'proveedor':
 * @property integer $idProveedor
 * @property string $rifProv
 * @property string $nombreProv
 * @property string $fechaIngProv
 * @property string $descripcionProv
 * @property string $statusProv
 * @property string $telefonoProv
 * @property string $correoProv
 * @property string $direccionProv
 *
 * The followings are the available model relations:
 * @property Productos[] $productoses
 */
class Proveedor extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Proveedor the static model class
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
		return 'proveedor';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('nombreProv, fechaIngProv, descripcionProv, statusProv, telefonoProv, correoProv, direccionProv', 'required'),
			array('rifProv', 'length', 'max'=>15),
			array('nombreProv, descripcionProv, correoProv', 'length', 'max'=>100),
			array('statusProv', 'length', 'max'=>10),
			array('telefonoProv', 'length', 'max'=>20),
			array('direccionProv', 'length', 'max'=>255),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('idProveedor, rifProv, nombreProv, fechaIngProv, descripcionProv, statusProv, telefonoProv, correoProv, direccionProv', 'safe', 'on'=>'search'),
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
			'productoses' => array(self::HAS_MANY, 'Productos', 'idProveedor'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'idProveedor' => 'Id del Proveedor',
			'rifProv' => 'Rif del Proveedor',
			'nombreProv' => 'Nombre del Proveedor',
			'fechaIngProv' => 'Fecha de Ingreso',
			'descripcionProv' => 'Descripcion',
			'statusProv' => 'Estatus del Proveedor',
			'telefonoProv' => 'Telefono del Proveedor',
			'correoProv' => 'Correo del Proveedor',
			'direccionProv' => 'Direccion',
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

		$criteria->compare('idProveedor',$this->idProveedor);
		$criteria->compare('rifProv',$this->rifProv,true);
		$criteria->compare('nombreProv',$this->nombreProv,true);
		$criteria->compare('fechaIngProv',$this->fechaIngProv,true);
		$criteria->compare('descripcionProv',$this->descripcionProv,true);
		$criteria->compare('statusProv',$this->statusProv,true);
		$criteria->compare('telefonoProv',$this->telefonoProv,true);
		$criteria->compare('correoProv',$this->correoProv,true);
		$criteria->compare('direccionProv',$this->direccionProv,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}
