<?php

/**
 * This is the model class for table "muncp".
 *
 * The followings are the available columns in table 'muncp':
 * @property integer $id_muncp
 * @property string $nb_muncp
 * @property integer $id_ciudad
 *
 * The followings are the available model relations:
 * @property Ciudad $idCiudad
 * @property Parroquia[] $parroquias
 */
class Muncp extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'muncp';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('nb_muncp, id_ciudad', 'required'),
			array('id_ciudad', 'numerical', 'integerOnly'=>true),
			array('nb_muncp', 'length', 'max'=>30),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id_muncp, nb_muncp, id_ciudad', 'safe', 'on'=>'search'),
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
			'idCiudad' => array(self::BELONGS_TO, 'Ciudad', 'id_ciudad'),
			'parroquias' => array(self::HAS_MANY, 'Parroquia', 'id_muncp'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id_muncp' => 'Id Muncp',
			'nb_muncp' => 'Nb Muncp',
			'id_ciudad' => 'Id Ciudad',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id_muncp',$this->id_muncp);
		$criteria->compare('nb_muncp',$this->nb_muncp,true);
		$criteria->compare('id_ciudad',$this->id_ciudad);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Muncp the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
