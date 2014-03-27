<?php
/* @var $this UsersController */
/* @var $model Users */

$this->breadcrumbs=array(
	'Users'=>array('index'),
	$model->Name,
);

$this->menu=array(
    array('label'=>'Список Юзерів', 'url'=>array('index')),
    array('label'=>'Створити Юзера', 'url'=>array('create')),
    array('label'=>'Показати юзера', 'url'=>array('view', 'id'=>$model->ID)),

	array('label'=>'Видалити Юзера', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->ID),'confirm'=>'Ви впевнені що хочете видалити юзера')),

);
?>

<h1>Список Юзерів<?php echo $model->ID; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'ID',
		'Password',
		'Login',
		'Username',
		'Name',
		'Email',
		'Address',
		'Comments',
		'Birtday',
		'Language',
		'Style',
		'Role',
		'Hasavatar',
	),
)); ?>
