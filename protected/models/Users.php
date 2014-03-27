<?php


class Users extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
    public $yes;
	public function tableName()
	{
		return 'users';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('Password, Login, Email', 'required'),
			array('Style, Role, Hasavatar', 'numerical', 'integerOnly'=>true),
			array('Password', 'length', 'max'=>128),
			array('Login, Username', 'length', 'max'=>16),
			array('Name', 'length', 'max'=>48),
			array('Email, Address', 'length', 'max'=>64),
			array('Language', 'length', 'max'=>1),
			array('Comments, Birtday', 'safe'),
//			 The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('ID, Password, Login, Username, Name, Email, Address, Comments, Birtday, Language, Style, Role, Hasavatar', 'safe', 'on'=>'search'),
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
			'Password' => 'Пароль',
			'Login' => 'Логін',
			'Username' => 'Прізвище',
			'Name' => 'Імя',
			'Email' => 'Електронна адреса',
			'Address' => 'Адреса',
			'Comments' => 'Коментарі',
			'Birtday' => 'День народженя',
			'Language' => 'Мова',
			'Style' => 'Стиль',
			'Role' => 'Роль',
			'Hasavatar' => 'Hasavatar',
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
		$criteria->compare('Password',$this->Password,true);
		$criteria->compare('Login',$this->Login,true);
		$criteria->compare('Username',$this->Username,true);
		$criteria->compare('Name',$this->Name,true);
		$criteria->compare('Email',$this->Email,true);
		$criteria->compare('Address',$this->Address,true);
		$criteria->compare('Comments',$this->Comments,true);
		$criteria->compare('Birtday',$this->Birtday,true);
		$criteria->compare('Language',$this->Language,true);
		$criteria->compare('Style',$this->Style);
		$criteria->compare('Role',$this->Role);
		$criteria->compare('Hasavatar',$this->Hasavatar);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
//    public function beforeSave()
//    {
//        if($this->isNewRecord)
//
//        $this->Birtday=time();
////        $this->Role=1;
//        $this->password=md5($this->password);
//        return parent::beforeSave();
//    }

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Users the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
