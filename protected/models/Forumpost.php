<?php

/**
 * This is the model class for table "forumpost".
 *
 * The followings are the available columns in table 'forumpost':
 * @property string $ID
 * @property string $Creatorid
 * @property string $Caption
 * @property string $Message
 * @property string $Creationdate
 * @property string $Lastupdate
 * @property string $Entryid
 * @property string $Postnumber
 * @property string $Locationid
 */
class Forumpost extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'forumpost';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('Creatorid, Message, Creationdate, Entryid, Locationid', 'required'),
			array('Creatorid, Entryid, Postnumber, Locationid', 'length', 'max'=>10),
			array('Caption', 'length', 'max'=>32),
			array('Lastupdate', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('ID, Creatorid, Caption, Message, Creationdate, Lastupdate, Entryid, Postnumber, Locationid', 'safe', 'on'=>'search'),
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
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'ID' => 'ID',
			'Creatorid' => 'Creatorid',
			'Caption' => 'Caption',
			'Message' => 'Message',
			'Creationdate' => 'Creationdate',
			'Lastupdate' => 'Lastupdate',
			'Entryid' => 'Entryid',
			'Postnumber' => 'Postnumber',
			'Locationid' => 'Locationid',
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

		$criteria->compare('ID',$this->ID,true);
		$criteria->compare('Creatorid',$this->Creatorid,true);
		$criteria->compare('Caption',$this->Caption,true);
		$criteria->compare('Message',$this->Message,true);
		$criteria->compare('Creationdate',$this->Creationdate,true);
		$criteria->compare('Lastupdate',$this->Lastupdate,true);
		$criteria->compare('Entryid',$this->Entryid,true);
		$criteria->compare('Postnumber',$this->Postnumber,true);
		$criteria->compare('Locationid',$this->Locationid,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Forumpost the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
