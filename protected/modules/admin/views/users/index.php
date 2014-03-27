<?php
/* @var $this UsersController */
/* @var $model Users */

$this->breadcrumbs=array(
	'Users'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'Список Юзерів', 'url'=>array('index')),
	array('label'=>'Створити юзера', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#users-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Настройка Юзерів</h1>


<?php echo CHtml::link('Advanced Search','#',array('class'=>'search-button')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'users-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'ID',
		'Password',
		'Login',
		'Username',
		'Name',
		'Email',
//        'Role',
        'Role'=>array(
            'name'=>'Role',
            'value'=>'($data->Role==2)?"Admin ":"User"',
            'filter'=>array(1=>"Admin",2=>"User"),

        )
    ,
//        'Birtday' => array(
//            'name' => 'Birtday',
//            'value' => 'date("j.m.Y H:i",$data->Birtday)',
//            'filter' => false,
//        ),
		/*
		'Address',
		'Comments',
		'Birtday',
		'Language',
		'Style',
		'Role',
		'Hasavatar',
		*/
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
