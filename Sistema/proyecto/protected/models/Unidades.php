<?php

/**
 * This is the model class for table "unidades".
 *
 * The followings are the available columns in table 'unidades':
 * @property integer $id_unid
 * @property string $nb_unid
 * @property string $coor_unid
 * @property integer $id_prrq
 * @property string $persona_encarg
 * @property integer $tipo_unid
 *
 * The followings are the available model relations:
 * @property Personal[] $personals
 * @property Parroquia $idPrrq
 * @property TipoUnidad $tipoUn
 */
class Unidades extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'unidades';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('nb_unid, persona_encarg, tipo_unid', 'required'),
			array('id_prrq, tipo_unid', 'numerical', 'integerOnly'=>true),
			array('nb_unid', 'length', 'max'=>50),
			array('coor_unid', 'length', 'max'=>100),
			array('persona_encarg', 'length', 'max'=>45),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id_unid, nb_unid, coor_unid, id_prrq, persona_encarg, tipo_unid', 'safe', 'on'=>'search'),
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
			'personals' => array(self::HAS_MANY, 'Personal', 'unidad'),
			'idPrrq' => array(self::BELONGS_TO, 'Parroquia', 'id_prrq'),
			'tipoUn' => array(self::BELONGS_TO, 'TipoUnidad', 'tipo_unid'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id_unid' => 'Id Unid',
			'nb_unid' => 'Nombre de Unidad',
			'coor_unid' => 'Coordenadas de Unidad',
			'id_prrq' => 'Parroquia',
			'persona_encarg' => 'Personal Encargado',
			'tipo_unid' => 'Tipo de Unidad',
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

		$criteria->compare('id_unid',$this->id_unid);
		$criteria->compare('nb_unid',$this->nb_unid,true);
		$criteria->compare('coor_unid',$this->coor_unid,true);
		$criteria->compare('id_prrq',$this->id_prrq);
		$criteria->compare('persona_encarg',$this->persona_encarg,true);
		$criteria->compare('tipo_unid',$this->tipo_unid);

		$_SESSION['datos_filtrados'] = new CActiveDataProvider($this, array(
 			'criteria'=>$criteria,
 			'pagination'=>false,
 		));


		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Unidades the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
