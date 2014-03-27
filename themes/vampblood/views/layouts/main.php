<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="language" content="en"/>

    <!-- blueprint CSS framework -->
    <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/ie.css"
          media="screen, projection"/>
    <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/screen.css"
          media="screen, projection"/>
    <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/print.css"
          media="print"/>
    <!--[if lt IE 8]>

    <![endif]-->

    <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/category.css"/>
    <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->theme->baseUrl; ?>/css/form.css"/>

    <title><?php echo CHtml::encode($this->pageTitle); ?></title>
</head>

<body>

<div class="container" id="page">

    <div id="header">
        <div id="logo">
            <div class="it"></div>
            <div id="flag" class="flag"></div>
            <div id="flag_br" class="flag"></div>
            <div id="mainmenu">
                <?php $this->widget('zii.widgets.CMenu', array(
                    'items' => array(
                        array('label' => 'Home', 'url' => array('/site/index')),
                        array('label' => 'Контакти', 'url' => array('/site/contact')),
                        array('label' => 'Форум', 'url' => array('/site/forum')),
                        array('label' => 'Адмін', 'url' => array('/admin')),
                        array('label' => 'Login', 'url' => array('/site/login'), 'visible' => Yii::app()->user->isGuest),
                        array('label' => 'Logout ', 'url' => array('/site/logout'), 'visible' => !Yii::app()->user->isGuest),
                        array('label' => 'Регістрація (' . Yii::app()->user->name . ')', 'url' => array('/site/registtion'), 'visible' => Yii::app()->user->isGuest),

                    ),
                )); ?>
            </div>
            <?php echo CHtml::encode(Yii::app()->name); ?></div>

    </div>
    <!-- header -->

    <div id="category">
        <?php $this->widget('zii.widgets.CMenu', array(
            'items' => Category::menu('вверх'),

//			'items'=>array(
////				array('label'=>'Home', 'url'=>array('/site/index')),
////				array('label'=>'About', 'url'=>array('/site/page', 'view'=>'about')),
//				array('label'=>'Адмінка', 'url'=>array('/admin')),
////				array('label'=>'Login', 'url'=>array('/site/login'), 'visible'=>Yii::app()->user->isGuest),
////				array('label'=>'Logout ('.Yii::app()->user->name.')', 'url'=>array('/site/logout'), 'visible'=>!Yii::app()->user->isGuest)
//			),
        )); ?>
        <?php $this->widget('zii.widgets.CBreadcrumbs', array(
            'links' => $this->breadcrumbs,
        )); ?><!-- breadcrumbs -->

        <?php echo $content; ?>

        <div id="footer">
            Copyright &copy; <?php echo date('Y'); ?> by My Company.<br/>
            All Rights Reserved.<br/>
            <?php echo Yii::powered(); ?>
        </div>
        <!-- footer -->

    </div>
    <!-- page -->

</body>
</html>