<?php

/**
 * This is the model class for table "categorias".
 *
 * The followings are the available columns in table 'categorias':
 * @property integer $idCategoria
 * @property string $nombreCate
 * @property string $descripcionCate
 *
 * The followings are the available model relations:
 * @property Productos[] $productoses
 */
class Categorias extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Categorias the static model class
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
		return 'categorias';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('nombreCate', 'required'),
			array('nombreCate', 'length', 'max'=>50),
			array('descripcionCate', 'length', 'max'=>200),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('idCategoria, nombreCate, descripcionCate', 'safe', 'on'=>'search'),
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
			'productoses' => array(self::HAS_MANY, 'Productos', 'idCategoria'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'idCategoria' => 'Id Categoria',
			'nombreCate' => 'Nombre Cate',
			'descripcionCate' => 'Descripcion Cate',
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

		$criteria->compare('idCategoria',$this->idCategoria);
		$criteria->compare('nombreCate',$this->nombreCate,true);
		$criteria->compare('descripcionCate',$this->descripcionCate,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}