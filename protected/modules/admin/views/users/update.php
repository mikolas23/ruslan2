<?php
/* @var $this UsersController */
/* @var $model Users */

$this->breadcrumbs=array(
	'Users'=>array('index'),
	$model->Name=>array('view','id'=>$model->ID),
	'Update',
);

$this->menu=array(
	array('label'=>'Список Юзерів', 'url'=>array('index')),
	array('label'=>'Створити Юзера', 'url'=>array('create')),
	array('label'=>'Показати юзера', 'url'=>array('view', 'id'=>$model->ID)),

);
?>

<h1>Update Users <?php echo $model->ID; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>