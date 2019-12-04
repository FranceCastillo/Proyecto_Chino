<?php

/**
 * This is the model class for table "cliente".
 *
 * The followings are the available columns in table 'cliente':
 * @property integer $idCLiente
 * @property integer $cedulaRifCli
 * @property string $nombreCli
 * @property string $apellidoCli
 * @property string $generoCli
 * @property string $descripcionCli
 * @property string $telefonoCli
 * @property string $direccionCli
 * @property string $correoCli
 *
 * The followings are the available model relations:
 * @property Ventas[] $ventases
 */
class Cliente extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Cliente the static model class
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
		return 'cliente';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('cedulaRifCli, nombreCli, apellidoCli, generoCli, telefonoCli, direccionCli, correoCli', 'required'),
			array('cedulaRifCli', 'numerical', 'integerOnly'=>true),
			array('nombreCli, apellidoCli', 'length', 'max'=>30),
			array('generoCli', 'length', 'max'=>1),
			array('descripcionCli, correoCli', 'length', 'max'=>100),
			array('telefonoCli', 'length', 'max'=>20),
			array('direccionCli', 'length', 'max'=>255),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('idCLiente, cedulaRifCli, nombreCli, apellidoCli, generoCli, descripcionCli, telefonoCli, direccionCli, correoCli', 'safe', 'on'=>'search'),
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
			'ventases' => array(self::HAS_MANY, 'Ventas', 'idCliente'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'idCLiente' => 'Id Cliente',
			'cedulaRifCli' => 'Cedula/Rif',
			'nombreCli' => 'Nombre del Cliente',
			'apellidoCli' => 'Apellido del Cliente',
			'generoCli' => 'Genero',
			'descripcionCli' => 'Descripcion del Cliente',
			'telefonoCli' => 'Telefono del Cliente',
			'direccionCli' => 'Direccion del Cliente',
			'correoCli' => 'Correo del Cliente',
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

		$criteria->compare('idCLiente',$this->idCLiente);
		$criteria->compare('cedulaRifCli',$this->cedulaRifCli);
		$criteria->compare('nombreCli',$this->nombreCli,true);
		$criteria->compare('apellidoCli',$this->apellidoCli,true);
		$criteria->compare('generoCli',$this->generoCli,true);
		$criteria->compare('descripcionCli',$this->descripcionCli,true);
		$criteria->compare('telefonoCli',$this->telefonoCli,true);
		$criteria->compare('direccionCli',$this->direccionCli,true);
		$criteria->compare('correoCli',$this->correoCli,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}
