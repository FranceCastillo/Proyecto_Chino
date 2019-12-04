<?php

/**
 * This is the model class for table "parroquia".
 *
 * The followings are the available columns in table 'parroquia':
 * @property integer $id_prrq
 * @property string $nb_prrq
 * @property integer $id_muncp
 *
 * The followings are the available model relations:
 * @property Muncp $idMuncp
 * @property Unidades[] $unidades
 */
class Parroquia extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'parroquia';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('nb_prrq, id_muncp', 'required'),
			array('id_muncp', 'numerical', 'integerOnly'=>true),
			array('nb_prrq', 'length', 'max'=>30),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id_prrq, nb_prrq, id_muncp', 'safe', 'on'=>'search'),
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
			'idMuncp' => array(self::BELONGS_TO, 'Muncp', 'id_muncp'),
			'unidades' => array(self::HAS_MANY, 'Unidades', 'id_prrq'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id_prrq' => 'Id Prrq',
			'nb_prrq' => 'Nb Prrq',
			'id_muncp' => 'Id Muncp',
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

		$criteria->compare('id_prrq',$this->id_prrq);
		$criteria->compare('nb_prrq',$this->nb_prrq,true);
		$criteria->compare('id_muncp',$this->id_muncp);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Parroquia the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
